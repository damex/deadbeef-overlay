# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins eutils git-2

GITORIOUS_PROJECT="deadbeef-sm-plugins"
GITORIOUS_REPOSITORY="bs2b"

DESCRIPTION="bs2b DSP plugin for DeaDBeeF, using libbs2b."
HOMEPAGE="https://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}"
EGIT_REPO_URI="git://gitorious.org/${GITORIOUS_PROJECT}/${GITORIOUS_REPOSITORY}.git"
EGIT_COMMIT="a1961cd2f0686a7bdf0915f1fc7d62b5aba369bd"

LICENSE="MIT"
KEYWORDS="~*"

RDEPEND="media-libs/libbs2b"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
