# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

RESTRICT="mirror"

IUSE="doc examples vim"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio plugins and applications development. The Faust compiler translates signal processing specifications into C++ code."
HOMEPAGE="http://faudiostream.sourceforge.net"
SRC_URI="mirror://sourceforge/faudiostream/${P}.zip"

RDEPEND="sys-devel/bison
		 sys-devel/flex
		 media-libs/lv2"
DEPEND="sys-apps/sed"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	# fix prefix
	sed -i -e "s\/usr/local\ /usr\ " Makefile
	sed -i -e "s\/usr/local\ /usr\ " tools/faust2appls/Makefile
}

src_compile() {
	emake || die "parallel make failed"
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc README
	if use doc ; then
	    dodoc WHATSNEW documentation/*.pdf "documentation/additional documentation" || die "install doc failed"
	fi
	if use examples ; then
	    insinto /usr/share/"${P}"/examples
	    doins examples/* || die "install examples failed"
	fi
	if use vim; then
		insinto /usr/share/vim/vimfiles/syntax
		doins syntax-highlighting/faust.vim
	fi
}
