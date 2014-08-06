# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils fdo-mime gnome2-utils

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

KEYWORDS="~*"

DESCRIPTION="foobar2k-like music player"
HOMEPAGE="http://deadbeef.sourceforge.net/"

RESTRICT="mirror"

LICENSE="BSD
	UNICODE
	ZLIB
	aac? ( GPL GPL-2 )
	adplug? ( LGPL-2.1 ZLIB )
	alsa? ( GPL-2 )
	alac? ( MIT GPL-2 )
	cover? ( ZLIB )
	cdda? ( GPL-2 LGPL-2 GPL-3 )
	converter? ( GPL-2 )
	curl? ( curl ZLIB )
	dts? ( GPL-2 )
	dumb? ( DUMB-0.9.3 ZLIB )
	equalizer? ( GPL-2 )
	ffmpeg? ( GPL-2 )
	flac? ( BSD )
	gme? ( LGPL-2.1 )
	gtk2? ( GPL-2 )
	gtk3? ( GPL-2 )
	hotkeys? ( ZLIB )
	lastfm? ( GPL-2 )
	libnotify? ( GPL-2 )
	libsamplerate? ( GPL-2 )
	m3u? ( ZLIB )
	mac? ( GPL-2 )
	midi? ( LGPL-2.1 ZLIB )
	mms? ( GPL-2 ZLIB )
	mono2stereo? ( ZLIB )
	mp3? ( GPL-2 ZLIB )
	musepack? ( BSD ZLIB )
	nullout? ( ZLIB )
	oss? ( GPL-2 )
	pltbrowser? ( ZLIB )
	psf? ( BSD GPL MAME ZLIB )
	pulseaudio? ( GPL-2 )
	shellexec? ( GPL-2 )
	shn? ( shorten ZLIB )
	sid? ( GPL-2 )
	sndfile? ( GPL-2 LGPL-2 )
	tta? ( BSD ZLIB )
	vorbis? ( BSD ZLIB )
	vtx? ( GPL-2 ZLIB )
	wavpack? ( BSD )
	wma? ( GPL-2 LGPL-2 ZLIB )
	zip? ( ZLIB )"

SLOT="0"

IUSE="+alsa +gtk2 +hotkeys +m3u +mp3 +sndfile +vorbis +flac
	aac adplug alac psf cdda converter cover cover-imlib2 cover-network curl dts dumb equalizer ffmpeg
	filebrowser gme gtk3 infobar lastfm mac midi mms mono2stereo musepack nls lastfm libnotify libsamplerate
	nullout oss psf pulseaudio pltbrowser shellexec shellexecui shn sid tta unity vk vtx wavpack wma zip"

REQUIRED_USE="cover-imlib2? ( cover )
	cover-network? ( cover curl )
	converter? ( || ( gtk2 gtk3 ) )
	cover? ( || ( gtk2 gtk3 ) )
	lastfm? ( curl )
	pltbrowser? ( || ( gtk2 gtk3 ) )
	shellexecui? ( || ( gtk2 gtk3 ) shellexec )
	|| ( alsa oss pulseaudio nullout )"

LANGS="be bg bn ca cs da de el en_GB es et eu fa fi fr gl he hr hu id it ja kk km lg
	lt nl pl pt pt_BR ro ru si_LK sk sl sr sr@latin sv te tr ug uk vi zh_CN zh_TW"

for lang in ${LANGS} ; do
	IUSE+=" linguas_${lang}"
done

PDEPEND="filebrowser? ( media-plugins/deadbeef-fb )
	infobar? ( media-plugins/deadbeef-infobar )
	vk? ( media-plugins/deadbeef-vk )"

RDEPEND="aac? ( media-libs/faad2 )
	adplug? ( media-libs/adplug )
	alsa? ( media-libs/alsa-lib )
	alac? ( media-libs/faad2 )
	cdda? ( dev-libs/libcdio media-libs/libcddb )
	cover? ( cover-imlib2? ( media-libs/imlib2 )
		media-libs/libpng
		virtual/jpeg )
	curl? ( net-misc/curl )
	ffmpeg? ( virtual/ffmpeg )
	flac? ( media-libs/flac )
	gme? ( sys-libs/zlib )
	gtk2? ( x11-libs/gtk+:2 )
	gtk3? ( x11-libs/gtk+:3 )
	hotkeys? ( x11-libs/libX11 )
	libnotify? ( sys-apps/dbus )
	libsamplerate? ( media-libs/libsamplerate )
	mac? ( dev-lang/yasm )
	midi? ( media-sound/timidity-freepats )
	mp3? ( media-libs/libmad )
	psf? ( sys-libs/zlib )
	pulseaudio? ( media-sound/pulseaudio )
	sndfile? ( media-libs/libsndfile )
	vorbis? ( media-libs/libogg
		media-libs/libvorbis )
	wavpack? ( media-sound/wavpack )
	zip? ( dev-libs/libzip )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( virtual/libintl
		dev-util/intltool )"

src_prepare() {
	if use midi ; then
		# set default gentoo path
		sed -e 's;/etc/timidity++/timidity-freepats.cfg;/usr/share/timidity/freepats/timidity.cfg;g' \
		-i "${S}/plugins/wildmidi/wildmidiplug.c" || die
	fi

	if ! use unity ; then
		# remove unity trash
		epatch "${FILESDIR}/${PN}-0.6.2-or-higher-remove-unity-trash.patch"
	fi
}

src_configure() {
	econf --disable-coreaudio \
		--disable-portable \
		--disable-static \
		--docdir=/usr/share/${PN} \
		$(use_enable aac) \
		$(use_enable adplug) \
		$(use_enable alac) \
		$(use_enable alsa) \
		$(use_enable cdda) \
		$(use_enable converter) \
		$(use_enable cover artwork) \
		$(use_enable cover-imlib2 artwork-imlib2) \
		$(use_enable cover-network artwork-network) \
		$(use_enable curl vfs-curl) \
		$(use_enable dts dca) \
		$(use_enable dumb) \
		$(use_enable equalizer supereq) \
		$(use_enable ffmpeg) \
		$(use_enable flac) \
		$(use_enable gme) \
		$(use_enable gtk2) \
		$(use_enable gtk3) \
		$(use_enable hotkeys) \
		$(use_enable lastfm lfm) \
		$(use_enable libnotify notify) \
		$(use_enable libsamplerate src) \
		$(use_enable m3u) \
		$(use_enable mac ffap) \
		$(use_enable midi wildmidi) \
		$(use_enable mms) \
		$(use_enable mono2stereo) \
		$(use_enable mp3 mad) \
		$(use_enable musepack) \
		$(use_enable nls) \
		$(use_enable nullout) \
		$(use_enable oss) \
		$(use_enable pulseaudio pulse) \
		$(use_enable pltbrowser) \
		$(use_enable psf) \
		$(use_enable shellexec shellexec) \
		$(use_enable shellexecui shellexecui) \
		$(use_enable shn) \
		$(use_enable sid) \
		$(use_enable sndfile) \
		$(use_enable tta) \
		$(use_enable vorbis) \
		$(use_enable vtx) \
		$(use_enable wavpack) \
		$(use_enable wma) \
		$(use_enable zip vfs-zip)
}

pkg_preinst() {
	if use gtk2 || use gtk3 ; then
		gnome2_icon_savelist
		gnome2_schemas_savelist
	fi
}

pkg_postinst() {
	if use midi ; then
		einfo "enable the freepats support for wildmidi manually, using the following command:"
		einfo "eselect timidity set --global freepats"
	fi

	if use gtk2 || use gtk3 ; then
		fdo-mime_desktop_database_update
		fdo-mime_mime_database_update
		gnome2_icon_cache_update
		gnome2_schemas_update
	fi
}

pkg_postrm() {
	if use gtk2 || use gtk3 ; then
		fdo-mime_desktop_database_update
		fdo-mime_mime_database_update
		gnome2_icon_cache_update
		gnome2_schemas_update
	fi
}
