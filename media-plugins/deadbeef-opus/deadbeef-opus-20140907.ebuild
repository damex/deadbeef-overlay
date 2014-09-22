# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins git-r3

BITBUCKET_USERNAME="Lithopsian"

DESCRIPTION="DeaDBeeF ogg opus decoder plugin"
HOMEPAGE="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}/overview"
EGIT_REPO_URI="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}.git"
EGIT_COMMIT="2f6e853bc88a5978b143d36708f2d6f9a47e1e17"

RESTRICT="strip"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND=">=media-libs/opusfile-0.5[float,http]
	media-libs/libogg"

DEPEND="${RDEPEND}"
