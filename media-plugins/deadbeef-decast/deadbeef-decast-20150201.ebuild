# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

BITBUCKET_USERNAME="thesame"
BITBUCKET_COMMIT="5cb4be2c2cf0"

DESCRIPTION="DeaDBeeF podcast subscription plugin"
HOMEPAGE="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN/deadbeef-/}/overview"
SRC_URI="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN/deadbeef-/}/get/${BITBUCKET_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
KEYWORDS="~*"

S="${WORKDIR}/${BITBUCKET_USERNAME}-${PN/deadbeef-/}-${BITBUCKET_COMMIT}"

src_compile() {
	use gtk2 && GTKVER=2 emake
	use gtk3 && GTKVER=3 emake
}
