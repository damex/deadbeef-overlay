# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit git-2

DESCRIPTION="bs2b DSP plugin for DeaDBeeF, using libbs2b."
HOMEPAGE="https://gitorious.org/deadbeef-sm-plugins/bs2b"
EGIT_REPO_URI="git://gitorious.org/deadbeef-sm-plugins/bs2b.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-sound/deadbeef
	media-libs/libbs2b"

DEPEND="${RDEPEND}"

src_install(){
	insinto "/usr/$(get_libdir)/deadbeef"
	doins "bs2b.so" || die
	dodoc "COPYING" || die
}
