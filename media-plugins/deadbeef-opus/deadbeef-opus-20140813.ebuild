# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins git-2

BITBUCKET_USERNAME="Lithopsian"

DESCRIPTION="DeaDBeeF ogg opus decoder plugin"
HOMEPAGE="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}/overview"
EGIT_REPO_URI="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}.git"
EGIT_COMMIT="f2be0ac698227ee02d0bb21d2a688858fd4d5fb7"

RESTRICT="strip"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND=">=media-libs/opusfile-0.5[float,http]
	media-libs/libogg"

DEPEND="${RDEPEND}"

S="${WORKDIR}/opus-${PV}"
