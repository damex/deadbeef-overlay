# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools eutils

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="http://sourceforge.net/projects/deadbeef-fb/"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}_src.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~*"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

RDEPEND="gtk2? ( media-sound/deadbeef[gtk2] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

DEPEND="${RDEPEND}"

S="${WORKDIR}/deadbeef-devel"

src_prepare() {
	epatch "${FILESDIR}/${PN}-avoid-version.patch"

	if use gtk3 ; then
		epatch "${FILESDIR}/${PN}-stop-treating-warnings-as-errors.patch"
	fi

	eautoreconf
}

src_configure() {
	econf --disable-static \
		$(use_enable gtk2) \
		$(use_enable gtk3)
}

src_install() {
	if use gtk2 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${S}/.libs/ddb_misc_filebrowser_GTK2.so" || die
	fi

	if use gtk3 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${S}/.libs/ddb_misc_filebrowser_GTK3.so" || die
	fi
}
