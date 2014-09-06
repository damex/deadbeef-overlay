# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools deadbeef-plugins git-2

GITHUB_USERNAME="Jerry-Ma"
GITHUB_REPOSITORY="DeaDBeeF-MPRIS-plugin"

DESCRIPTION="DeaDBeeF MPRIS-plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"
EGIT_COMMIT="1984b96f3b0fb59009319fd9fbf767e66af941f7"

LICENSE="GPL-3"
KEYWORDS="~*"
IUSE=""

src_prepare(){
	epatch "${FILESDIR}/${PN}-makefile.patch"

	eautoreconf
}
