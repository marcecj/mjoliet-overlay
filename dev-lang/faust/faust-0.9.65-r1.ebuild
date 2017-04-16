# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

RESTRICT="mirror"

IUSE="doc examples httpd vim-syntax"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio."
HOMEPAGE="http://faust.grame.fr"
SRC_URI="mirror://sourceforge/faudiostream/${P}.zip"

DEPEND="sys-devel/bison
		 sys-devel/flex
		 httpd? ( net-libs/libmicrohttpd )"
RDEPEND="sys-apps/sed"

DOCS=( README WHATSNEW )

PATCHES=( "${FILESDIR}/faust_0.9.65_build_httpd.patch" )

src_prepare() {
	# fix prefix
	sed -i -e "s\/usr/local\ /usr\ " Makefile || die "sed failed"
	sed -i -e "s\/usr/local\ /usr\ " tools/faust2appls/Makefile || die "sed failed"

	default
}

src_compile() {
	emake all

	if use httpd; then
		emake httpd httpd-shared
	fi
}

src_install() {
	default

	if use doc ; then
		dodoc documentation/*.pdf "documentation/additional documentation" || die "install doc failed"
	fi

	if use examples ; then
		insinto /usr/share/"${P}"/examples
		doins examples/* || die "install examples failed"
	fi

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins syntax-highlighting/faust.vim
	fi
}

pkg_postinst() {
	elog "Depending on the architecture a FAUST program will target, you will"
	elog "need any of the following additional dependencies:"
	elog
	elog "  media-libs/lv2"
	elog "  media-libs/ladspa-sdk"
	elog "  media-libs/portaudio"
	elog "  media-sound/jack-audio-connection-kit"
	elog "  x11-libs/qt-core and x11-libs/qt-gui"
	elog "  sci-mathematics/octave"
	elog "  ..."
	elog
	elog "This list is incomplete, see the FAUST documentation for more. For"
	elog "some of the architectures, the necessary dependencies are only"
	elog "available through overlays (e.g., Pure Data)."
}
