# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins eutils git-2

GITHUB_USERNAME="barthez"

DESCRIPTION="DeaDBeeF player Gnome (via DBus) multimedia keys plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${PN}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${PN}.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND="dev-libs/glib:2"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}