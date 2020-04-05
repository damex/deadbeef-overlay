# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF simple stereo widener plugin"
HOMEPAGE="https://gitorious.org/deadbeef-sm-plugins/stereo-widener"
EGIT_REPO_URI="https://gitorious.org/deadbeef-sm-plugins/stereo-widener.git"

LICENSE="MIT"
KEYWORDS=""

PATCHES=(
	"${FILESDIR}/${PN}-api.patch"
	"${FILESDIR}/${PN}-build.patch"
)
