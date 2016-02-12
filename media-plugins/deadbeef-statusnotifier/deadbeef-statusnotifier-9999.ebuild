# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

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
	local mycmakeargs="
		$(cmake-utils_use_use gtk2 GTK2)
		$(cmake-utils_use_use gtk3 GTK3)"
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}
