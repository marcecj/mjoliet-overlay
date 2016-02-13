# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

RESTRICT="mirror"

DESCRIPTION="A unit testing framework for C++ (similar to JUnit, CppUnit, and xUnit)."
HOMEPAGE="http://cxxtest.com/"
SRC_URI="https://sourceforge.net/projects/${PN}/files/${PN}/${PV}/${P}.zip"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples doc"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl"

S="${WORKDIR}/${PN}"

src_install() {
	dobin bin/cxxtestgen

	doheader -r cxxtest

	dodoc README NOTES Versions
	if use doc; then
		dodoc doc/guide.{pdf,epub,txt}
		dohtml doc/guide.html
	fi

	if use examples; then
		dodoc -r doc/examples
	fi
}
