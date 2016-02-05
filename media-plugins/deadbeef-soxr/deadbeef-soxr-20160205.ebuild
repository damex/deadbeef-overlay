# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit deadbeef-plugins

GITHUB_COMMIT="f0732d685715782c9d045cf0f9da1055e7d2c851"

DESCRIPTION="DeaDBeeF sox resampler plugin"
HOMEPAGE="https://github.com/silentlexx/deadbeef_soxr"
SRC_URI="https://github.com/silentlexx/deadbeef_soxr/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" media-libs/soxr"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN/-/_}-${GITHUB_COMMIT}"
