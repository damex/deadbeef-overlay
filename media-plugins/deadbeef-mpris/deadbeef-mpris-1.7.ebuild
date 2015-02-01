# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools deadbeef-plugins

GITHUB_USERNAME="Serranya"
GITHUB_REPOSITORY="deadbeef-mpris2-plugin"

DESCRIPTION="DeaDBeeF MPRIS plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/releases/download/v${PV}/${GITHUB_REPOSITORY}-${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-3"
KEYWORDS="~*"
IUSE=""

S="${WORKDIR}/${P/-mpris/}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --disable-static
}
