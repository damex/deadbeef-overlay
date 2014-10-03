# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_waveform_seekbar"

DESCRIPTION="DeaDBeeF waveform seekbar plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~*"

RDEPEND+=" dev-db/sqlite:3"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${PV}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags-lm.patch"
}
