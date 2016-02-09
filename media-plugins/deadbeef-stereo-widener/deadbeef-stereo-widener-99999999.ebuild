# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF simple stereo widener plugin"
HOMEPAGE="https://gitorious.org/deadbeef-sm-plugins/stereo-widener"
EGIT_REPO_URI="https://gitorious.org/deadbeef-sm-plugins/stereo-widener.git"

LICENSE="MIT"
KEYWORDS=""

src_prepare() {
	epatch "${FILESDIR}/${PN}-api.patch"
	epatch "${FILESDIR}/${PN}-build.patch"
}
