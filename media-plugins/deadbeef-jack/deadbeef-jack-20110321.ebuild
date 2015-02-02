# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="jack"
GITORIOUS_COMMIT="62d1e6ac0452b7baa92fcc75b59bcb960df06da8"

DESCRIPTION="DeaDBeeF jack output plugin"
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
SRC_URI="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}/archive/${GITORIOUS_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~*"

RDEPEND+=" media-sound/jack-audio-connection-kit"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${GITORIOUS_PROJECT}-${GITORIOUS_REPOSITORY}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
