# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins git-r3

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="jack"

DESCRIPTION="DeaDBeeF jack output plugin"
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
EGIT_REPO_URI="git://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}.git"

LICENSE="MIT"
KEYWORDS=""

RDEPEND="media-sound/jack-audio-connection-kit"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
