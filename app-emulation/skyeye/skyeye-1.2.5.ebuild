# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/skyeye/skyeye-1.0.0.ebuild,v 1.3 2006/01/03 23:36:00 vapier Exp $

EAPI="2"

inherit autotools

DESCRIPTION="an ARM and Blackfin embedded hardware simulator"
HOMEPAGE="http://skyeye.sourceforge.net"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/skyeye/${P}_REL.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="sys-libs/ncurses
	media-libs/freetype
	>=x11-libs/gtk+-2
	>=dev-libs/glib-2
	x11-libs/pango"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${S}_REL"

src_compile() {
	econf
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog MAINTAINERS NEWS README REPORTING-BUGS
}
