# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="bs2b"
GITORIOUS_COMMIT="a1961cd2f0686a7bdf0915f1fc7d62b5aba369bd"

DESCRIPTION="DeaDBeeF bs2b dsp plugin"
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
SRC_URI="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}/archive/${GITORIOUS_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~*"

RDEPEND+=" media-libs/libbs2b"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${GITORIOUS_PROJECT}-${GITORIOUS_REPOSITORY}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
