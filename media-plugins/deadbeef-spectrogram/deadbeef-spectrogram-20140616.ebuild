# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_spectrogram"
GITHUB_COMMIT="309aba047017c6427d12ded98608c398cf8cbe23"

DESCRIPTION="DeaDBeeF spectrogram plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~*"

RDEPEND+=" sci-libs/fftw:3.0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${GITHUB_COMMIT}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}
