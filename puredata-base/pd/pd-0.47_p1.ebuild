# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

MY_P="${P/_p/-}"

RESTRICT="mirror"

DESCRIPTION="Open Source visual programming language by Miller S. Puckette"
HOMEPAGE="https://puredata.info/"
SRC_URI="http://msp.ucsd.edu/Software/${MY_P}.src.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa jack portaudio portmidi fftw"

DEPEND="dev-lang/tcl:0
	dev-lang/tk:0
	alsa? ( media-libs/alsa-lib )
	fftw? ( sci-libs/fftw:3.0 )
	jack? ( media-sound/jack-audio-connection-kit )
	portaudio? ( media-libs/portaudio )
	portmidi? ( media-libs/portmidi )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}/"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable alsa) \
		$(use_enable jack) \
		$(use_enable portaudio) \
		$(use_enable portmidi) \
		$(use_enable fftw)
}
