# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
RESTRICT="mirror"

inherit python autotools eutils

DESCRIPTION="An interactive Python shell written in PyGtk"
HOMEPAGE="http://www.reinteract.org/"
SRC_URI="http://download.reinteract.org/sources/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/numpy
		dev-python/matplotlib
		dev-python/pygtk"
RDEPEND="media-sound/sox"

src_prepare() {
	eautoreconf || die "autoreconf failed"
}

src_configure() {
	econf || die "failed to econf ${PN}"
}

src_compile () {
	emake || die  "failed to emake ${PN}"
}

src_install () {
	emake DESTDIR="${D}" install || "make install failed"
}
