# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

inherit eutils git-2

IUSE="libfaust httpd doc examples vim-syntax"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio."
HOMEPAGE="http://faust.grame.fr"

COMMON_DEPEND=">=sys-devel/llvm-3.0
		httpd? ( net-libs/libmicrohttpd )"
RDEPEND="${COMMON_DEPEND}
		sys-apps/sed"
DEPEND="${COMMON_DEPEND}
		 sys-devel/bison
		 sys-devel/clang
		 sys-devel/flex"

EGIT_REPO_URI="git://git.code.sf.net/p/faudiostream/code"
EGIT_COMMIT="4652444b8fe79c8a87696d4ebfbe79f88b735fa6"
EGIT_PROJECT="faust2"

src_prepare() {
	epatch "${FILESDIR}/faust-1.9999_do_not_append_t_flag.patch"
	epatch "${FILESDIR}/faust-1.9999_fix_llvm-c-dsp_h.patch"
	epatch "${FILESDIR}/faust-1.9999_build_libfaust.patch"
	epatch "${FILESDIR}/faust-1.9999_build_libhttpdfaust.patch"
	epatch "${FILESDIR}/faust-1.9999_makefile_add_shared_targets.patch"
}

# TODO: handle static libraries separately
src_compile() {
	emake all

	if use libfaust; then
		emake libfaust
	fi

	if use httpd; then
		emake httpd httpd-shared
	fi

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
