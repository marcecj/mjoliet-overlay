# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

RESTRICT="mirror"

inherit eutils

DESCRIPTION="Revel, the Really Easy Video Encoding Library"
HOMEPAGE="http://revel.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/revel/files/revel-src/${PV}/${P}.tar.bz2/download -> ${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/xvid"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}/revel_fix_missing_include.patch"
}

src_install(){
	dolib.a src/librevel.a
}
