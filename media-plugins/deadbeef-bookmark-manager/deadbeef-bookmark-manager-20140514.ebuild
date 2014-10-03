# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_bookmark_manager"
GITHUB_COMMIT="ff827d577941481b1e6e360f87a254f50c524628"

DESCRIPTION="DeaDBeeF bookmark manager plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
SRC_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${GITHUB_REPOSITORY}-${GITHUB_COMMIT}"

LICENSE="GPL-2"
KEYWORDS="~*"
