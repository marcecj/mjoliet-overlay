# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit unpacker

RESTRICT="mirror"
DESCRIPTION="user contributed instruments for zynaddsubfx"
HOMEPAGE="https://proaudio.tuxfamily.org/"
SRC_URI="https://download.tuxfamily.org/proaudio/distfiles/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE=""
RDEPEND="|| ( media-sound/zynaddsubfx media-sound/yoshimi )"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	unpacker *.tar.*
	rm *.tar.*
	find -name 'CVS' -exec rm -rf {} \; &>/dev/null
}

src_install() {
	local banks_collection="/usr/share/${PN%-*}/banks/"
	dodir "${banks_collection}"
	fowners -R root:root  "${banks_collection}"
	fperms -R 600 "${banks_collection}"
	fperms 755 "${banks_collection}"

	insinto "${banks_collection}"
	doins -r zyn_*
	dodoc README ChangeLog
}
