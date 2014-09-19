# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins git-r3

EGIT_REPO_URI="git://git.code.sf.net/p/${PN}/code"
EGIT_BRANCH="master"

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="http://sourceforge.net/projects/${PN}"

LICENSE="GPL-2"
KEYWORDS=""

S="${WORKDIR}/deadbeef-devel"

src_prepare() {
	epatch "${FILESDIR}/${PN}-avoid-version.patch"

	if use gtk3 ; then
		epatch "${FILESDIR}/${PN}-gtk3-version.patch"
		epatch "${FILESDIR}/${PN}-stop-treating-warnings-as-errors.patch"
	fi

	eautoreconf
}
