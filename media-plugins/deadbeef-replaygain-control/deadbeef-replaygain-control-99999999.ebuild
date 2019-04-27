# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF replay gain control plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_replaygain_control"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_replaygain_control.git"

LICENSE="GPL-2"
KEYWORDS=""

PATCHES=(
	"${FILESDIR}/${PN}-cflags.patch"
)

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
