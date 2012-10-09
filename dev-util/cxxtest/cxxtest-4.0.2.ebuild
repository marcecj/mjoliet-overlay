# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

DESCRIPTION="CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit, CppUnit, and xUnit."
HOMEPAGE="http://cxxtest.com/"
SRC_URI="http://sourceforge.net/projects/${PN}/files/${PN}/${PV}/${P}.zip"

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

	insinto /usr/include/
	doins -r cxxtest

	dodoc README NOTES Versions
	if use doc; then
		dodoc doc/guide.{pdf,epub,txt}
		dohtml doc/*
	fi

	if use examples; then
		dodoc -r doc/examples
	fi
}
