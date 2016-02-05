# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit deadbeef-plugins git-r3

GITHUB_COMMIT="f0732d685715782c9d045cf0f9da1055e7d2c851"

DESCRIPTION="DeaDBeeF sox resampler plugin"
HOMEPAGE="https://github.com/silentlexx/deadbeef_soxr"
EGIT_REPO_URI="https://gitorious.org/silentlexx/deadbeef_soxr.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" media-libs/soxr:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN/-/_}-${GITHUB_COMMIT}"
