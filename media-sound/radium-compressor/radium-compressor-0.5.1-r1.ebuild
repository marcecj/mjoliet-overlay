# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

RESTRICT="mirror"

inherit toolchain-funcs

DESCRIPTION="Radium Compressor is a JACK version of the system compressor in Radium."
HOMEPAGE="https://github.com/kmatheussen/radium_compressor"
SRC_URI="https://github.com/kmatheussen/${PN/-/_}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/faust-0.9.58
		media-sound/jack-audio-connection-kit
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		|| ( >=sys-devel/gcc-4.7.0:* >=sys-devel/clang-3.0:* )"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/fix_makefile.patch" )

DOCS=( README COPYING Changelog )

S="${WORKDIR}/${PN/-/_}-${PV}"

src_compile() {
	CXX=$(tc-getCXX)

	if [ $(gcc-major-version) -lt 4 -o \
		\( $(gcc-major-version) -eq 4 -a $(gcc-minor-version) -lt 7 \) ]; then
		elog "Your version of gcc is too old for radium-compressor, but it"
		elog "seems you have clang installed, so we will try that instead."

		CXX=clang++
	fi

	CXX=${CXX} emake all
}

src_install() {
	emake PREFIX="${ED}"/usr install
	einstalldocs
}
