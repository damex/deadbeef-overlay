# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins

GITHUB_COMMIT="62d1e6ac0452b7baa92fcc75b59bcb960df06da8"

DESCRIPTION="DeaDBeeF jack output plugin"
HOMEPAGE="https://github.com/Alexey-Yakovenko/jack"
SRC_URI="https://github.com/Alexey-Yakovenko/jack/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" virtual/jack:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/jack-${GITHUB_COMMIT}"

PATCHES=(
	"${FILESDIR}/${PN}-api.patch"
	"${FILESDIR}/${PN}-build.patch"
)
