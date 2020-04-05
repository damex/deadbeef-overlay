# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins git-r3

GITHUB_USERNAME="barthez"

DESCRIPTION="DeaDBeeF gnome (via dbus) multimedia keys plugin"
HOMEPAGE="https://github.com/barthez/deadbeef-gnome-mmkeys"
EGIT_REPO_URI="https://github.com/barthez/${PN}.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" sys-apps/dbus:0"

PATCHES=( -F3 "${FILESDIR}/${PN}.patch" )
