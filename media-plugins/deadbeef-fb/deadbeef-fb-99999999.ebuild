# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins git-r3

EGIT_REPO_URI="https://gitlab.com/zykure/deadbeef-fb.git"
EGIT_BRANCH="master"

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="https://gitlab.com/zykure/deadbeef-fb"

LICENSE="GPL-2"
KEYWORDS=""

IUSE+=" debug"

RDEPEND+=" !media-plugins/deadbeef-librarybrowser:0"

DEPEND="${RDEPEND}"

PATCHES=( -p0 "${FILESDIR}/${PN}-avoid-version-${PV}.patch" )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --disable-static \
		$(use_enable debug) \
		$(use_enable gtk2) \
		$(use_enable gtk3)
}
