# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF sox resampler plugin"
HOMEPAGE="https://github.com/silentlexx/deadbeef_soxr"
EGIT_REPO_URI="https://github.com/silentlexx/deadbeef_soxr.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" media-libs/soxr:0"

DEPEND="${RDEPEND}"
