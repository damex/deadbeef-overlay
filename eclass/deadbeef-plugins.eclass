# Distributed under the terms of the GNU General Public License v2

inherit eutils

: ${SLOT:=0}

RDEPEND="${RDEPEND} media-sound/deadbeef"
DEPEND="${DEPEND} media-sound/deadbeef"

RESTRICT="mirror"

if [[ "${DEADBEEF_GUI}" == "yes" ]] ; then
	IUSE+=" +gtk2 gtk3"
	REQUIRED_USE="|| ( gtk2 gtk3 )"
	RDEPEND="${RDEPEND}
		gtk2? ( media-sound/deadbeef[gtk2] )
		gtk3? ( media-sound/deadbeef[gtk3] )"
fi

EXPORT_FUNCTIONS "src_configure src_compile src_install"

deadbeef-plugins_src_configure() {
	if [[ "${DEADBEEF_GUI}" == "yes" ]] ; then
		if in_iuse gtk2 && in_iuse gtk3 && [[ -f "${S}/configure" ]] && grep -q "enable-gtk2" "${S}/configure" && grep -q "enable-gtk3" "${S}/configure"; then
			econf --disable-static \
				$(use_enable gtk2) \
				$(use_enable gtk3)
		fi

		if in_iuse gtk2 && in_iuse gtk3 && [[ -f "${S}/CMakeLists.txt" ]] && grep -q "WITH_GTK2" "${S}/CMakeLists.txt" && grep -q "WITH_GTK3" "${S}/CMakeLists.txt"; then
			local mycmakeargs="
				$(cmake-utils_use_with gtk2 GTK2) 
				$(cmake-utils_use_with gtk3 GTK3)"
			cmake-utils_src_configure
		fi
	else
		if ! in_iuse gtk2 || ! in_iuse gtk3 && [[ -f "${S}/configure" ]] ; then
			econf --disable-static
		fi
	fi
}

deadbeef-plugins_src_compile() {
	local find_gtk2=`grep "gtk2:" "${S}/Makefile"`
	local find_gtk3=`grep "gtk3:" "${S}/Makefile"`

	if [[ "${DEADBEEF_GUI}" == "yes" ]] ; then
		if in_iuse gtk2 && use gtk2 && [[ -f "${S}/Makefile" ]] && [[ -n "${find_gtk2}" ]] ; then
			emake gtk2
		fi

		if in_iuse gtk3 && use gtk3 && [[ -f "${S}/Makefile" ]] && [[ -n "${find_gtk3}" ]] ; then
			emake gtk3
		fi

		if in_iuse gtk2 && in_iuse gtk3 && [[ -f "${S}/Makefile" ]] && [[ ! -n "${find_gtk2}" ]] && [[ ! -n "${find_gtk3}" ]] ; then
			emake
		fi
	else
		if ! in_iuse gtk2 || ! in_iuse gtk3 && [[ -f "${S}/Makefile" ]] ; then
			emake
		fi
	fi

	if [[ -f "${S}/CMakeLists.txt" ]] ; then
		cmake-utils_src_compile
	fi
}

deadbeef-plugins_src_install() {
	local plugins=`find "${WORKDIR}" -name "*.so"`
	for plugin in ${plugins}
		do
			insinto "/usr/$(get_libdir)/deadbeef"
			doins "${plugin}" || die
		done
}
