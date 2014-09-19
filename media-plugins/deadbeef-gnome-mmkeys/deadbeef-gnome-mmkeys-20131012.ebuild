# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins git-r3

GITHUB_USERNAME="barthez"

DESCRIPTION="DeaDBeeF gnome (via dbus) multimedia keys plugin"
HOMEPAGE="https://github.com/${GITHUB_USERNAME}/${PN}"
EGIT_REPO_URI="https://github.com/${GITHUB_USERNAME}/${PN}.git"
EGIT_COMMIT="8e95cd380ba457fe6b666e5e704aa823d5eca1fa"

LICENSE="GPL-2"
KEYWORDS="~*"

RDEPEND="dev-libs/glib:2"

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"
}
