# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF sox resampler plugin"
HOMEPAGE="https://github.com/silentlexx/deadbeef_soxr"
EGIT_REPO_URI="https://gitorious.org/silentlexx/deadbeef_soxr.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" media-libs/soxr:0"

DEPEND="${RDEPEND}"
