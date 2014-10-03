# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools deadbeef-plugins

GITHUB_USERNAME="Jerry-Ma"
GITHUB_REPOSITORY="DeaDBeeF-MPRIS-plugin"
GITHUB_COMMIT="1984b96f3b0fb59009319fd9fbf767e66af941f7"

DESCRIPTION="DeaDBeeF MPRIS plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~*"
IUSE=""

S="${WORKDIR}/${GITHUB_REPOSITORY}-${GITHUB_COMMIT}"

src_prepare(){
	epatch "${FILESDIR}/${PN}-makefile.patch"

	eautoreconf
}
