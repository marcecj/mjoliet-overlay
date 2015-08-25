# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="A clone of pdb, the standard library python debugger."
HOMEPAGE="https://code.google.com/p/pdb-clone/ https://pypi.python.org/pypi/pdb-clone"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="!<app-vim/pyclewn-2.0.0"
RDEPEND="${DEPEND}"

DOCS=( README{,.rst} NEWS pdb-clone.wiki/ )
