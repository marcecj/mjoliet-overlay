# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

RESTRICT="mirror"

inherit distutils autotools git

DESCRIPTION="Python plugins for gnucap"
HOMEPAGE="https://github.com/henjo/gnucap-python"
EGIT_REPO_URI="git://github.com/henjo/gnucap-python.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/numpy
		sci-electronics/libgnucap"
DEPEND="${RDEPEND}
		dev-lang/swig"

src_prepare() {
	# automake fails otherwise
	cp README.rst README
	AN_OPTS="--gnu"
	eautoreconf || die "eautoreconf failed"
}

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	emake || die "emake failed"
	distutils_src_compile
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	distutils_src_install
}
