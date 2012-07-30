# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit versionator

RESTRICT="mirror"
MY_PV=$(delete_all_version_separators)

DESCRIPTION="Speech analysis and synthesis"
SRC_URI="http://www.fon.hum.uva.nl/praat/${PN}${MY_PV}_sources.tar.gz"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"
DEPEND="|| ( ( x11-libs/libXmu
			x11-libs/libXt
			x11-libs/libX11
			x11-libs/libICE
			x11-libs/libXext
			x11-libs/libSM
			x11-libs/libXp
		)
		virtual/x11
	)
	app-accessibility/espeak
	media-libs/alsa-lib
	x11-libs/gtk+:2"

RDEPEND="${DEPEND}"
KEYWORDS="~amd64"
IUSE=""
LICENSE="GPL-2"
SLOT="0"

S="${WORKDIR}/sources_${MY_PV}"

src_prepare() {
	sed -i "s:speak_lib.h:espeak/speak_lib.h:g" dwtools/SpeechSynthesizer.h
	sed -i "/MAKE.*espeak/ d" makefile
	sed -i "s:espeak/libespeak.a:-lespeak:g" makefile
}

src_compile() {
	# TODO: following line should be updated for non-linux etc. builds
	# (Flammie does not have testing equipment)
	cp "${S}/makefiles/makefile.defs.linux" "${S}/makefile.defs"
	emake || die "emake failed"
}

src_install() {
	dobin praat
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r test/*
}

