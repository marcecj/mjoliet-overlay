# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

inherit multilib

DESCRIPTION="A set of C++ classes that provide a common API for realtime audio
input/output across Linux, Macintosh OS-X and Windows operating systems."
HOMEPAGE="http://www.music.mcgill.ca/~gary/rtaudio/"
SRC_URI="http://www.music.mcgill.ca/~gary/rtaudio/release/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+alsa pulseaudio jack oss static-libs"

DEPEND="alsa? ( media-libs/alsa-lib )
		pulseaudio? ( media-sound/pulseaudio )
		jack? ( media-sound/jack-audio-connection-kit )"
RDEPEND="${DEPEND}"

src_configure() {
	myeconf = ""
	if use alsa; then
		myeconf = "$myeconf --with-alsa"
	fi
	if use pulseaudio; then
		myeconf = "$myeconf --with-pulse"
	fi
	if use jack; then
		myeconf = "$myeconf --with-jack"
	fi
	if use oss; then
		myeconf = "$myeconf --with-oss"
	fi

	econf ${myeconf}
}

src_compile() {
	emake -j1 || die
}

src_install() {
	dosym librtaudio.so.${PV} /usr/$(get_libdir)/librtaudio.so.4
	dolib.so librtaudio.so*

	if use static-libs; then
		dolib.a librtaudio.a
	fi

	insinto /usr/include/
	doins RtAudio.h RtError.h
}
