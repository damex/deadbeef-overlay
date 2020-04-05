# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF jack output plugin"
HOMEPAGE="https://github.com/Alexey-Yakovenko/jack"
EGIT_REPO_URI="https://github.com/Alexey-Yakovenko/jack.git"

LICENSE="MIT"
KEYWORDS=""

RDEPEND+=" virtual/jack:0"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-api.patch"
	"${FILESDIR}/${PN}-build.patch"
)
