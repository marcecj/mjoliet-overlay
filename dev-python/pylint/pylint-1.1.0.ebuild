# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python code static checker"
HOMEPAGE="http://www.logilab.org/project/pylint http://pypi.python.org/pypi/pylint"
SRC_URI="ftp://ftp.logilab.org/pub/${PN}/${P}.tar.gz mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="examples"

# Versions specified in __pkginfo__.py.
RDEPEND=">=dev-python/logilab-common-0.53.0[${PYTHON_USEDEP}]
		 >=dev-python/astroid-1.0.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DISTUTILS_IN_SOURCE_BUILD=1

PATCHES=( "${FILESDIR}"/${PN}-0.26.0-gtktest.patch )

python_install_all() {
	distutils-r1_python_install_all
	doman man/{pylint,pylint-gui,pyreverse,epylint,symilar}.1

	if use examples; then
		docinto examples
		dodoc examples/*
	fi
}

pkg_postinst() {
	# Optional dependency on "tk" USE flag would break support for Jython.
	elog "pylint-gui script requires dev-lang/python with \"tk\" USE flag enabled."
}
