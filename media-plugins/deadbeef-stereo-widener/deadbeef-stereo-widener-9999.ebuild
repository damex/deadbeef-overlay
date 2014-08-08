# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils git-2

DESCRIPTION="A simple stereo widener plugin for DeaDBeeF."
HOMEPAGE="https://gitorious.org/deadbeef-sm-plugins/stereo-widener"
EGIT_REPO_URI="git://gitorious.org/deadbeef-sm-plugins/stereo-widener.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-sound/deadbeef"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}

src_install(){
	insinto "/usr/$(get_libdir)/deadbeef"
	doins "${S}/ddb_stereo_widener.so" || die
	dodoc "${S}/COPYING" || die
}
