# Distributed under the terms of the GNU General Public License v2=

EAPI="5"

DEADBEEF_GUI="yes"

inherit deadbeef-plugins eutils git-2

GITHUB_USERNAME="cboxdoerfer"
GITHUB_REPOSITORY="ddb_replaygain_control"

DESCRIPTION="Replay Gain Control Plugin for the DeaDBeeF Audio Player"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPOSITORY}.git"

LICENSE="GPL-2"
KEYWORDS=""

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}
