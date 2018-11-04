# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

RESTRICT="mirror"

inherit multilib

# TODO: add back the USE libfaust and httpd
IUSE="doc examples vim-syntax"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Functional AUdio STream is a functional programming language for real-time DSP."
HOMEPAGE="http://faust.grame.fr"
SRC_URI="https://github.com/grame-cncm/faust/releases/download/${PV}/${P}.tar.gz"

COMMON_DEPEND="<=sys-devel/llvm-6.0.1:*
		net-libs/libmicrohttpd"
RDEPEND="${COMMON_DEPEND}
		sys-apps/sed"
DEPEND="${COMMON_DEPEND}
		 sys-devel/bison
		 sys-devel/clang
		 sys-devel/flex"

src_prepare() {
	default

	# This is a dirty hack, but otherwise the build system errors out with the
	# message "Unknown LLVM version 6.0.1".
	sed -i "s:6.0.0:6.0.0 6.0.1:g" compiler/Makefile.unix || die "sed failed"

	# fix multilib-strict warnings
	sed -i "s:/lib/:/$(get_libdir)/:g" Makefile || die "sed failed"
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

	dodoc README.md WHATSNEW

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
