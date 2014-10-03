# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins mercurial

DESCRIPTION="DeaDBeeF infobar plugin that shows lyrics and artist's biography for the current track"
HOMEPAGE="https://bitbucket.org/dsimbiriatin/${PN}/wiki/Home"
EHG_REPO_URI="https://bitbucket.org/dsimbiriatin/${PN}"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" dev-libs/libxml2
	x11-libs/gdk-pixbuf[jpeg]
	media-sound/deadbeef[curl]"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.diff"
	epatch "${FILESDIR}/${PN}-load-gtk2-and-gtk3-version-fix.diff"
	epatch "${FILESDIR}/${PN}-focus-fix.diff"
}
