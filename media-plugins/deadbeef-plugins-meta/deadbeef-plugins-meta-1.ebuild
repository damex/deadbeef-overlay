# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DESCRIPTION="Meta package for DeaDBeeF player third party plugins"
HOMEPAGE="http://deadbeef.sourceforge.net"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="*"
IUSE="archive bookmark-manager bs2b filebrowser gnome-mmkeys infobar jack mpris musical-spectrum
	opus replaygain-control spectrogram stereo-widener vk vu-meter waveform-seekbar"

PDEPEND="archive? ( media-plugins/deadbeef-archive-reader )
	bookmark-manager? ( media-plugins/deadbeef-bookmark-manager )
	bs2b? ( media-plugins/deadbeef-bs2b )
	filebrowser? ( media-plugins/deadbeef-fb )
	gnome-mmkeys? ( media-plugins/deadbeef-gnome-mmkeys )
	infobar? ( media-plugins/deadbeef-infobar )
	jack? ( media-plugins/deadbeef-jack )
	mpris? ( media-plugins/deadbeef-mpris )
	musical-spectrum? ( media-plugins/deadbeef-musical-spectrum )
	opus? ( media-plugins/deadbeef-opus )
	replaygain-control? ( media-plugins/deadbeef-replaygain-control )
	spectrogram? ( media-plugins/deadbeef-spectrogram )
	stereo-widener? ( media-plugins/deadbeef-stereo-widener )
	vk? ( media-plugins/deadbeef-vk )
	vu-meter? ( media-plugins/deadbeef-vu-meter )
	waveform-seekbar? ( media-plugins/deadbeef-waveform-seekbar )"
