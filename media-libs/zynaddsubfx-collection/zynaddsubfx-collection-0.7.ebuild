# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit unpacker
RESTRICT="mirror"
MY_PN="zynaddsubfx"
DESCRIPTION="user contributed instruments for zynaddsubfx"
HOMEPAGE="http://proaudio.tuxfamily.org/files"
SRC_URI="http://proaudio.tuxfamily.org/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE=""
RDEPEND="|| ( media-sound/zynaddsubfx media-sound/yoshimi )"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_unpack(){
	unpack ${A}
	unpacker *.tar.*
	rm *.tar.*
	find -name 'CVS' -exec rm -rf {} \; &>/dev/null
}

src_install(){
	banks_collection="/usr/share/${MY_PN}/banks/"
	dodir "${banks_collection}"
	fowners -R root:root  "${banks_collection}"
	fperms -R 600 "${banks_collection}"
	fperms 755 "${banks_collection}"

	insinto "${banks_collection}"
	doins -r zyn_*
	dodoc README ChangeLog
}

pkg_postinst() {
	einfo "This packages provides various user contributed instruments for zynaddsubfx"
}
