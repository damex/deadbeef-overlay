# Distributed under the terms of the GNU General Public License v2=

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_replaygain_control"
GITHUB_COMMIT="c0788d47e5bcc2428c57fe4321566891c4abe452"

DESCRIPTION="DeaDBeeF replay gain control plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~*"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${GITHUB_COMMIT}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}
