# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit cmake-utils deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF plasma5 tray icon plugin"
HOMEPAGE="https://github.com/vovochka404/deadbeef-statusnotifier-plugin"
EGIT_REPO_URI="https://github.com/vovochka404/deadbeef-statusnotifier-plugin.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" dev-libs/libdbusmenu:0"

DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DUSE_GTK2="$(usex gtk2)"
		-DUSE_GTK3="$(usex gtk3)"
	)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}
