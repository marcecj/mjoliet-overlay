# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/phasex/phasex-0.12.0_beta3.ebuild,v 1.2 2012/05/05 08:45:44 mgorny Exp $

EAPI="5"

inherit autotools

DESCRIPTION="Software synthesizer (Phase Harmonic Advanced Synthesis EXperiment)"
HOMEPAGE="http://sysex.net/phasex/"
SRC_URI="https://github.com/williamweston/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lash"

# NOTE: git has made lash support optional
RDEPEND="x11-libs/libX11
	media-sound/jack-audio-connection-kit
	media-libs/alsa-lib
	media-libs/libsamplerate
	x11-libs/gtk+:2
	lash? ( virtual/liblash )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eaclocal
	eautoconf
	eautomake
	eautoheader
}

src_configure() {
	myconf="-enable-arch=native --enable-parts=2 $(use_with lash)"
	econf $myconf
}
