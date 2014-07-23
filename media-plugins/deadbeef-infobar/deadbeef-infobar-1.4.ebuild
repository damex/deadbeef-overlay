# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils

DESCRIPTION="Infobar plugin for DeadBeeF audio player. Shows lyrics and artist's biography for the current track."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar/wiki/Home"
SRC_URI="mirror://bitbucket/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

RDEPEND="dev-libs/libxml2
	media-sound/deadbeef[curl]
	gtk2? ( media-sound/deadbeef[gtk2] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

DEPEND="${RDEPEND}"

src_compile() {
	if use gtk2 ; then
		emake gtk2
	fi

	if use gtk3 ; then
		emake gtk3
	fi
}

src_install() {
	if use gtk2 ; then
		insinto /usr/$(get_libdir)/deadbeef
		doins gtk2/ddb_infobar_gtk2.so
	fi

	if use gtk3 ; then
		insinto /usr/$(get_libdir)/deadbeef
		doins gtk3/ddb_infobar_gtk3.so
	fi
}
