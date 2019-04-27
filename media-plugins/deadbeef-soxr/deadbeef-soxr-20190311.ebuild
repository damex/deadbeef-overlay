# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit deadbeef-plugins

GITHUB_COMMIT="103341b7388d38110181494bb9763daa9dafa63e"

DESCRIPTION="DeaDBeeF sox resampler plugin"
HOMEPAGE="https://github.com/silentlexx/deadbeef_soxr"
SRC_URI="https://github.com/silentlexx/deadbeef_soxr/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" media-libs/soxr:0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN/-/_}-${GITHUB_COMMIT}"
