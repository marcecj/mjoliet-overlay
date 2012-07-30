# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/skyeye/skyeye-1.0.0.ebuild,v 1.3 2006/01/03 23:36:00 vapier Exp $

EAPI="3"

RESTRICT="mirror"

inherit autotools eutils multilib

DESCRIPTION="an ARM and Blackfin embedded hardware simulator"
HOMEPAGE="http://skyeye.sourceforge.net"
SRC_URI="http://sourceforge.net/projects/skyeye/files/skyeye/${P%%_rc1*}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# DEPEND="sys-devel/gcc:3.4
# DEPEND="sys-devel/binutils
	# dev-util/pkgconfig
	# x11-libs/libX11
	# x11-libs/pango
	# >=dev-libs/glib-2
	# >=x11-libs/gtk+-2
	# dev-libs/atk
	# media-libs/freetype"
DEPEND="sys-devel/binutils
	dev-util/pkgconfig
	~app-emulation/emul-linux-x86-baselibs-20100409
	~app-emulation/emul-linux-x86-gtklibs-20100409"

RDEPEND="${DEPEND}"
# RDEPEND="${DEPEND}
	# sys-libs/ncurses"


src_prepare() {
	# if [ "$(gcc-version)" != "3.4" ]; then
	#     die "Please use gcc-config to select gcc 3.4 or earlier"
	# fi
	# epatch "${FILESDIR}/Makefile.in.patch"
	sed -i 's:2.8):2.9):g' configure.in
	eautoreconf || die
}

S="${WORKDIR}/${PN}"

src_configure() {
	# multilib_toolchain_setup x86
	# econf --disable-shared --enable-static --without-included-ltdl || "die econf failed"
	econf --enable-shared --disable-static --without-included-ltdl || "die econf failed"
}

src_compile() {
	emake DESTDIR="${D}" lib || die "emake libs failed"
	emake DESTDIR="${D}" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install_lib || die "emake install_lib failed"
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_preinst() {
	rm -rd "${D}/usr/testsuite/" || die "removal of testsuite failed"
}
