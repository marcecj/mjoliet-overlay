# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/a2jmidid/a2jmidid-6.ebuild,v 1.2 2012/05/05 08:02:52 mgorny Exp $

EAPI="5"

inherit waf-utils

DESCRIPTION="Daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
HOMEPAGE="http://home.gna.org/a2jmidid/"
SRC_URI="http://download.gna.org/a2jmidid/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbus"

DEPEND="media-libs/alsa-lib
	media-sound/jack-audio-connection-kit
	dbus? ( sys-apps/dbus )
	virtual/pkgconfig
	dev-lang/python"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS README NEWS internals.txt)

src_configure() {
	local myconf

	if use !dbus ; then
	  myconf="${myconf} --disable-dbus"
	fi

	NO_WAF_LIBDIR=1
	waf-utils_src_configure ${myconf}
}
