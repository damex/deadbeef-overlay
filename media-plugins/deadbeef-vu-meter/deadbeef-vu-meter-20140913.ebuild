# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-2

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_vu_meter"

DESCRIPTION="DeaDBeeF vu meter plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"
EGIT_COMMIT="f3a6acd7ce9ae12c5069822cc41f87bacca1c5b4"

LICENSE="GPL-2"
KEYWORDS="~*"
