# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit deadbeef-plugins subversion

ASSEMBLA_PROJECT="deadbeef_vfs_archive_reader"

DESCRIPTION="DeaDBeeF vfs archive reader plugin with gzip, 7z and rar support"
HOMEPAGE="http://subversion.assembla.com/svn/${ASSEMBLA_PROJECT}"
ESVN_REPO_URI="http://subversion.assembla.com/svn/${ASSEMBLA_PROJECT}/trunk/src"
ESVN_REVISION="16"

LICENSE="LGPL-2.1"
KEYWORDS="~*"

src_prepare() {
	epatch "${FILESDIR}/${PN}-flags.patch"
}
