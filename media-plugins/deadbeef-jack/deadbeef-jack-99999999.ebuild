# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF jack output plugin"
HOMEPAGE="https://github.com/Alexey-Yakovenko/jack"
EGIT_REPO_URI="https://github.com/Alexey-Yakovenko/jack.git"

LICENSE="MIT"
KEYWORDS=""

RDEPEND+=" media-sound/jack-audio-connection-kit:0"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-api.patch"
	epatch "${FILESDIR}/${PN}-build.patch"
}
