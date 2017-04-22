# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

DESCRIPTION="Software synthesizer (Phase Harmonic Advanced Synthesis EXperiment)"
HOMEPAGE="https://github.com/disabled/phasex-dev/"
SRC_URI="mirror://github/disabled/${PN}-dev/${PN}-dev-m${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-libs/libX11
	media-sound/jack-audio-connection-kit
	media-libs/alsa-lib
	media-libs/libsamplerate
	x11-libs/gtk+:2
	virtual/liblash"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog README TODO doc/ROADMAP )

S="${WORKDIR}/${PN}-dev-m${PV}"
