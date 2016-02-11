# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

GITHUB_COMMIT="f1fc79733c8e488259ccf168bcf5b1445b71975c"

DESCRIPTION="DeaDBeeF quick search plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_quick_search"
SRC_URI="https://github.com/cboxdoerfer/ddb_quick_search/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/ddb_quick_search-${GITHUB_COMMIT}"

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
