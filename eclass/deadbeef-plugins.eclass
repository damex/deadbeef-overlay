# Distributed under the terms of the GNU General Public License v2

inherit eutils

: ${SLOT:=0}

RDEPEND="${RDEPEND} media-sound/deadbeef"
DEPEND="${DEPEND} media-sound/deadbeef"

RESTRICT="mirror"

if [[ ${DEADBEEF_GUI} == yes ]] ; then
	IUSE+=" +gtk2 gtk3"
	REQUIRED_USE="|| ( gtk2 gtk3 )"
	RDEPEND="${RDEPEND}
		gtk2? ( media-sound/deadbeef[gtk2] )
		gtk3? ( media-sound/deadbeef[gtk3] )"
fi

EXPORT_FUNCTIONS "src_compile src_install"

deadbeef-plugins_src_compile() {
	if in_iuse gtk2 && use gtk2 && [[ -f "${S}/Makefile" ]] && grep -q "gtk2:" "${S}/Makefile" ; then
		emake gtk2
	fi

	if in_iuse gtk3 && use gtk3 && [[ -f "${S}/Makefile" ]] && grep -q "gtk3:" "${S}/Makefile" ; then
		emake gtk3
	fi

	if ! in_iuse gtk2 || ! in_iuse gtk3 ; then
		emake
	fi
}

deadbeef-plugins_src_install() {
	local plugins=`find "${WORKDIR}" -name '*.so'`
	for plugin in $plugins
		do
			insinto "/usr/$(get_libdir)/deadbeef"
			doins "${plugin}" || die
		done
}
