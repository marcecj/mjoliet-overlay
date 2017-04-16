# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

RESTRICT="mirror"

# TODO: add back the USE libfaust and httpd
IUSE="doc examples vim-syntax"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

myP="${P/_alpha/.a}"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio."
HOMEPAGE="http://faust.grame.fr"
SRC_URI="mirror://sourceforge/faudiostream/${myP}.tgz"

COMMON_DEPEND="<sys-devel/llvm-4.0:*
		net-libs/libmicrohttpd"
RDEPEND="${COMMON_DEPEND}
		sys-apps/sed"
DEPEND="${COMMON_DEPEND}
		 sys-devel/bison
		 sys-devel/clang
		 sys-devel/flex"

S="${WORKDIR}/${myP}"

PATCHES=( "${FILESDIR}/${P}_fix_pthread_linking.patch" )

src_prepare() {
	default

	# this is a dirty hack, but otherwise the build system passes "-D3.7.1" to
	# gcc, which in turn causes a "macro names must be valid identifiers" type
	# error
	sed -i 's:3.9.0:3.9.0 3.9.1:g' compiler/Makefile.unix || die "sed failed"
}

# TODO: handle static libraries separately
src_compile() {
	emake world

	if use doc; then
		emake doc
	fi
}

src_install() {
	emake install PREFIX="${EPREFIX}/usr" DESTDIR="${D}"

	dodoc README WHATSNEW

	if use doc ; then
		dodoc documentation/*.pdf "documentation/additional documentation" || die "install doc failed"
		dodoc -r dox/html || die "install doxygen failed"
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