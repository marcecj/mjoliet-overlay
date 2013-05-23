# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

RESTRICT="mirror"

inherit eutils git-2

IUSE="doc examples vim"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DESCRIPTION="Faust AUdio STreams is a functional programming language for realtime audio plugins and applications development. The Faust compiler translates signal processing specifications into C++ code."
HOMEPAGE="http://faust.grame.fr"

DEPEND="sys-apps/sed
        sys-devel/llvm"
RDEPEND="${DEPEND}
         sys-devel/bison
         sys-devel/flex"

EGIT_REPO_URI="git://git.code.sf.net/p/faudiostream/code"
EGIT_BRANCH="faust2"
EGIT_PROJECT="faust2"

src_prepare() {
	epatch "${FILESDIR}/faust_1.9999_Makefile.patch"
}

src_install() {
    emake install PREFIX="${EPREFIX}/usr" DESTDIR="${D}"

    dodoc README WHATSNEW

    if use doc ; then
        dodoc documentation/*.pdf "documentation/additional documentation" || die "install doc failed"
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
