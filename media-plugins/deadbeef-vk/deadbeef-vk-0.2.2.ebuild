# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

MY_PN="db-vk"

DESCRIPTION="DeadBeef plugin for listening music from vkontakte.com"
HOMEPAGE="https://github.com/scorpp/db-vk"
SRC_URI="https://github.com/scorpp/${MY_PN}/archive/v${PV}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

RDEPEND="dev-libs/json-glib
	media-sound/deadbeef[curl]
	gtk2? ( media-sound/deadbeef[gtk2] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	mycmakeargs="
		$(cmake-utils_use_with gtk2 GTK2)
		$(cmake-utils_use_with gtk3 GTK3)"

	cmake-utils_src_configure
}

src_install() {
	if use gtk2 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${WORKDIR}/${P}_build/vkontakte_gtk2.so" || die
	fi

	if use gtk3 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${WORKDIR}/${P}_build/vkontakte_gtk3.so" || die
	fi
}
