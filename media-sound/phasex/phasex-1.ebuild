# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/phasex/phasex-0.12.0_beta3.ebuild,v 1.2 2012/05/05 08:45:44 mgorny Exp $

EAPI="5"

DESCRIPTION="Software synthesizer (Phase Harmonic Advanced Synthesis EXperiment)"
HOMEPAGE="https://github.com/disabled/phasex-dev/"
SRC_URI="mirror://github/disabled/${PN}-dev/${PN}-dev-m${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# NOTE: git has made lash support optional
RDEPEND="x11-libs/libX11
	media-sound/jack-audio-connection-kit
	media-libs/alsa-lib
	media-libs/libsamplerate
	x11-libs/gtk+:2
	virtual/liblash"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}-dev-m${PV}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog README TODO doc/ROADMAP
}
