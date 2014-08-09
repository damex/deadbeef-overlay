# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils git-2

DESCRIPTION="Waveform Seekbar plugin for DeaDBeeF audio player"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_waveform_seekbar"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_waveform_seekbar.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+gtk2 gtk3"
REQUIRED_USE="|| ( gtk2 gtk3 )"

RDEPEND="dev-db/sqlite:3
	gtk2? ( media-sound/deadbeef[gtk2] )
	gtk3? ( media-sound/deadbeef[gtk3] )"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags-lm.patch"
}

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
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${S}/gtk2/ddb_misc_waveform_GTK2.so" || die
	fi

	if use gtk3 ; then
		insinto "/usr/$(get_libdir)/deadbeef"
		doins "${S}/gtk3/ddb_misc_waveform_GTK3.so" || die
	fi
}
