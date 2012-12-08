# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

inherit scons-utils toolchain-funcs

DESCRIPTION="An advanced command-line based metronome for JACK."
HOMEPAGE="http://das.nasophon.de/klick/"
SRC_URI="http://das.nasophon.de/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="osc rubberband doc"

DEPEND="media-sound/jack-audio-connection-kit
		dev-libs/boost
		media-libs/libsamplerate
		media-libs/libsndfile
		osc? ( media-libs/liblo )
		rubberband? ( media-libs/rubberband )"
RDEPEND="${DEPEND}"

src_configure() {
	myesconsargs=(
		CC="$(tc-getCC)"
		PREFIX="${EPRFIX}/usr"
		$(use_scons osc OSC)
		$(use_scons rubberband RUBBERBAND)
	)
}

src_compile() {
	escons
}

src_install() {
	escons DESTDIR="${D}" install
	dodoc README NEWS

	if use doc; then
		dohtml doc/manual.html
	fi
}
