# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins

GITLAB_COMMIT="c2afbbe5a32d1fa997b20b962eacb012bc1b93a2"

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="https://gitlab.com/zykure/deadbeef-fb"
SRC_URI="https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=${PV/*_p/} -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

IUSE+=" debug"

RDEPEND+=" !media-plugins/deadbeef-librarybrowser:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/deadbeef-fb-${PV/*_p/}-${GITLAB_COMMIT}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-avoid-version.patch"

	eautoreconf
}

src_configure() {
	econf --disable-static \
		$(use_enable debug) \
		$(use_enable gtk2) \
		$(use_enable gtk3)
}
