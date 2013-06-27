# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
RESTRICT="mirror"

PYTHON_COMPAT=( python{2_6,2_7} )
inherit python-single-r1 autotools eutils

DESCRIPTION="An interactive Python shell written in PyGtk"
HOMEPAGE="http://www.reinteract.org/"
SRC_URI="http://download.reinteract.org/sources/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pygtk[${PYTHON_USEDEP}]"
RDEPEND="media-sound/sox
		${DEPEND}"

src_prepare() {
	eautoreconf || die "autoreconf failed"
}

src_configure() {
	# tell configure which python we want
	local PYTHON="${EPYTHON}"
	econf || die "failed to econf ${PN}"
}

src_compile () {
	emake || die  "failed to emake ${PN}"
}

src_install () {
	emake DESTDIR="${D}" install || "make install failed"
}
