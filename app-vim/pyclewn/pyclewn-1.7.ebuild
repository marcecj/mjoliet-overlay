# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

RESTRICT="mirror"

inherit eutils distutils vim-doc python

PYTHON_DEPEND="2:4"

DESCRIPTION="A debugger frontend for gvim written in python"
HOMEPAGE="http://pyclewn.wiki.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""
SRC_URI="mirror://sourceforge/${PN}/${P}.py2.tar.gz"

DEPEND="|| (
			>=app-editors/gvim-7.2[netbeans]
			>=app-editors/vim-7.3
		   )"
RDEPEND="${DEPEND}
	sys-devel/gdb"

S="$S.py2"

src_prepare() {
	sed -i -e "/vim_features/ d"  "${S}/setup.py" || die "sed failed!"
	sed -i -e "/build_vimhelp/ d" "${S}/setup.py" || die "sed failed!"
}

pkg_postinst() {
	update_vim_helptags
	distutils_pkg_postinst
}
