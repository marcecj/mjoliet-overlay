# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="live loop-based MIDI software sequencer"
HOMEPAGE="https://harmonyseq.wordpress.com/"
SRC_URI="http://launchpad.net/harmonyseq/stable/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-cpp/gtkmm:2.4
	dev-cpp/glibmm:2
	media-libs/alsa-lib
	dev-util/desktop-file-utils
	x11-misc/shared-mime-info
	media-libs/liblo"
RDEPEND="${DEPEND}
	x11-libs/gtk+:2"
