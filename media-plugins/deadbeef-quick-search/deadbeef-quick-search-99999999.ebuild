# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF quick search plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_quick_search"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_quick_search.git"

LICENSE="GPL-2"
KEYWORDS=""

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
