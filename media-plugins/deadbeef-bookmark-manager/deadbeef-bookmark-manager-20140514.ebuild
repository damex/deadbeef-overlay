# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITHUB_COMMIT="44b067c30d6301c2eca6e91159b6267fa847d850"

DESCRIPTION="DeaDBeeF bookmark manager plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_bookmark_manager"
SRC_URI="https://github.com/cboxdoerfer/ddb_bookmark_manager/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/ddb_bookmark_manager-${GITHUB_COMMIT}"
