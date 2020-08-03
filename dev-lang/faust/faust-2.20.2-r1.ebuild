# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

RESTRICT="mirror"

inherit cmake-utils multilib

# TODO: add back the USE libfaust and httpd
IUSE="doc examples vim-syntax"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Functional AUdio STream is a functional programming language for real-time DSP."
HOMEPAGE="https://faust.grame.fr"
SRC_URI="https://github.com/grame-cncm/${PN}/releases/download/${PV}/${P}.tar.gz"

COMMON_DEPEND="<=sys-devel/llvm-10.0.0:*
		net-libs/libmicrohttpd"
RDEPEND="${COMMON_DEPEND}
		sys-apps/sed"
DEPEND="${COMMON_DEPEND}
		 sys-devel/bison
		 sys-devel/clang
		 sys-devel/flex"

CMAKE_USE_DIR="${S}/build"

src_prepare() {
	default

	# fix multilib-strict warnings
	find build/ -name CMakeLists.txt -exec \
		sed -i "s:\${CMAKE_INSTALL_PREFIX}/lib:\${CMAKE_INSTALL_PREFIX}/$(get_libdir):g" {} \; || die

	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DHTTPDYNAMIC=ON
		-DINCLUDE_DYNAMIC=ON
		-DOSCDYNAMIC=ON
		)
	cmake-utils_src_configure
}

# TODO: handle static libraries separately
src_compile() {
	cmake-utils_src_compile

	if use doc; then
		emake doc
	fi
}

src_install() {
	cmake-utils_src_install

	dodoc README.md WHATSNEW.md

	if use doc ; then
		dodoc documentation/*.pdf "documentation/additional documentation" || die "install doc failed"
		dodoc -r dox/html || die "install doxygen failed"
	fi

	if use examples ; then
		insinto /usr/share/"${P}"/examples
		doins -r examples/* || die "install examples failed"
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
