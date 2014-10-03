# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools deadbeef-plugins git-r3

GITHUB_USERNAME="Jerry-Ma"
GITHUB_REPOSITORY="DeaDBeeF-MPRIS-plugin"

DESCRIPTION="DeaDBeeF MPRIS plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"

LICENSE="GPL-3"
KEYWORDS=""
IUSE=""

src_prepare(){
	epatch "${FILESDIR}/${PN}-makefile.patch"

	eautoreconf
}
