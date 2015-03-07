# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit eutils distutils-r1 vim-doc

DESCRIPTION="A debugger frontend for gvim written in python"
HOMEPAGE="http://pyclewn.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

DEPEND="|| (
			>=app-editors/gvim-7.2[netbeans]
			>=app-editors/vim-7.3
		   )"
RDEPEND="${DEPEND}
	sys-devel/gdb
	dev-python/pdb-clone
	$(python_gen_cond_dep \
		'dev-python/pdb-clone[${PYTHON_USEDEP}]' python{2_7,3_2,3_3})
	"

src_prepare() {
	sed -i -e "/vim_features/ d"  "${S}/setup.py" || die "sed failed!"
	sed -i -e "/build_vimhelp/ d" "${S}/setup.py" || die "sed failed!"
}
