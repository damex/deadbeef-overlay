# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DEADBEEF_GUI="yes"

inherit autotools deadbeef-plugins

DESCRIPTION="DeaDBeeF filebrowser plugin"
HOMEPAGE="http://sourceforge.net/projects/${PN}"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}_src.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~*"

S="${WORKDIR}/deadbeef-fb-devel"

src_prepare() {
	if use gtk3 ; then
		epatch "${FILESDIR}/${PN}-gtk3-version.patch"
	fi

	eautoreconf
}
