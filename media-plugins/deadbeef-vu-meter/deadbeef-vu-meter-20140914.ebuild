# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_vu_meter"
GITHUB_COMMIT="940d8d72a46993619c3fba4cde5e30c95f5a4b82"

DESCRIPTION="DeaDBeeF vu meter plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~*"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${GITHUB_COMMIT}"
