# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins

BITBUCKET_USERNAME="Lithopsian"

DESCRIPTION="DeaDBeeF ogg opus decoder plugin"
HOMEPAGE="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}/overview"
SRC_URI="https://bitbucket.org/${BITBUCKET_USERNAME}/${PN}/downloads/opus-${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="${RESTRICT} strip"

LICENSE="GPL-2"
KEYWORDS="~*"

RDEPEND+=" >=media-libs/opusfile-0.5[float,http]
	media-libs/libogg"

DEPEND="${RDEPEND}"

S="${WORKDIR}/opus-${PV}"
