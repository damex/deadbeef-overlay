# Distributed under the terms of the GNU General Public License v2

# @ECLASS: deadbeef-plugins.eclass
# @MAINTAINER:
# Roman Kuzmitsky <damex.pp@gmail.com>
# @BLURB: Eclass for automating deadbeef player plugins installation.
# @DESCRIPTION:
# This eclass makes trivial deadbeef plugin ebuilds possible.
# Many things that would normally be done manually is automated.

if [[ "${EAPI}" -lt 5 ]] ; then
	die "EAPI="${EAPI}" is not supported"
fi

inherit eutils

: ${SLOT:=0}

RDEPEND+=" media-sound/deadbeef"
DEPEND+=" media-sound/deadbeef"

RESTRICT="mirror"

if [[ "${DEADBEEF_GUI}" == "yes" ]] ; then
	IUSE+=" +gtk2 gtk3"
	REQUIRED_USE="|| ( gtk2 gtk3 )"
	GUI_DEPEND="gtk2? ( media-sound/deadbeef[gtk2] )
		gtk3? ( media-sound/deadbeef[gtk3] )"
	RDEPEND+=" ${GUI_DEPEND}"
	DEPEND+=" ${GUI_DEPEND}"
fi

EXPORT_FUNCTIONS "src_configure src_compile src_install"

# @FUNCTION: deadbeef-plugins_src_compile
# @DESCRIPTION:
# Doing checks for right configure options and configuring sources.
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

# @FUNCTION: deadbeef-plugins_src_compile
# @DESCRIPTION:
# Doing checks for right command to compile sources and finally compiling sources.
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

# @FUNCTION: deadbeef-plugins_src_install
# @DESCRIPTION:
# Looking for a *.so deadbeef plugins and installs found plugins to corresponding deadbeef directory.
deadbeef-plugins_src_install() {
	local plugins=`find "${WORKDIR}" -name "*.so" -type f`
	for plugin in ${plugins}
		do
			insinto "/usr/$(get_libdir)/deadbeef"
			doins "${plugin}"
		done
}
