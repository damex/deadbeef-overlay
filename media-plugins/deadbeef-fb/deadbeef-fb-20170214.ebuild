# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins

GITLAB_COMMIT="47bc3fe0fe151dfbb75f90f9e4d5e9a7affd280a"

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="https://gitlab.com/zykure/deadbeef-fb"
SRC_URI="https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=${GITLAB_COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

IUSE+=" debug"

RDEPEND+=" !media-plugins/deadbeef-librarybrowser:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/deadbeef-fb-${GITLAB_COMMIT}-${GITLAB_COMMIT}"

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
