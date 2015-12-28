# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITHUB_COMMIT="a1961cd2f0686a7bdf0915f1fc7d62b5aba369bd"

DESCRIPTION="DeaDBeeF bs2b dsp plugin"
HOMEPAGE="https://github.com/Alexey-Yakovenko/bs2b"
SRC_URI="https://github.com/Alexey-Yakovenko/bs2b/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" media-libs/libbs2b:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/bs2b-${GITHUB_COMMIT}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
