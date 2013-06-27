# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
PYTHON_MODNAME="dbtexmf"

inherit distutils-r1 eutils

DESCRIPTION="Transform DocBook using TeX macros"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
HOMEPAGE="http://dblatex.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-texlive/texlive-latexextra
	dev-texlive/texlive-mathextra
	dev-texlive/texlive-xetex
	dev-libs/libxslt
	app-text/docbook-xml-dtd
	dev-texlive/texlive-pictures"
RDEPEND="${DEPEND}"

src_prepare() {
	EPATCH_SOURCE="${FILESDIR}" \
	  EPATCH_SUFFIX="patch" \
	  EPATCH_FORCE="yes" \
	  epatch
}

src_install() {
	distutils-r1_src_install || die "distutils install failed"

	dobin "${S}"/scripts/dblatex || die "dobin failed"
}
