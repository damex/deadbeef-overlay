# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit git-2

DESCRIPTION="Bookmark Manager plugin for DeaDBeeF audio player"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_bookmark_manager"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_bookmark_manager.git"
EGIT_COMMIT="ff827d577941481b1e6e360f87a254f50c524628"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="media-sound/deadbeef"

DEPEND="${RDEPEND}"

src_install() {
	insinto "/usr/$(get_libdir)/deadbeef"
	doins "${S}/ddb_misc_bookmark_manager.so" || die
}
