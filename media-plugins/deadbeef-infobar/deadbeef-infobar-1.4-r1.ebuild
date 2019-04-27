# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins

DESCRIPTION="DeaDBeeF infobar plugin that shows lyrics and artist's biography"
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar"
SRC_URI="https://bitbucket.org/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

RDEPEND+=" dev-libs/libxml2:2
	x11-libs/gdk-pixbuf:2[jpeg]
	media-sound/deadbeef:0[curl]"

DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-cflags.diff"
	"${FILESDIR}/${PN}-load-gtk2-and-gtk3-version-fix.diff"
)

src_prepare() {
	default
	use gtk2 && eapply "${FILESDIR}/${PN}-focus-fix.diff"
}

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
