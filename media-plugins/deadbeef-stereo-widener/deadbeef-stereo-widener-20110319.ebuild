# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="stereo-widener"
GITORIOUS_COMMIT="d3990d772b02cdc6206f067748f5d1f9650616fb"

DESCRIPTION="DeaDBeeF simple stereo widener plugin"
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
SRC_URI="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}/archive/${GITORIOUS_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~*"

S="${WORKDIR}/${GITORIOUS_PROJECT}-${GITORIOUS_REPOSITORY}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
