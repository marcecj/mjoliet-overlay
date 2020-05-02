# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="irqtop is a simple monitor for /proc/interrupts."
HOMEPAGE="https://gitlab.com/elboulangero/irqtop/"
SRC_URI="https://gitlab.com/elboulangero/irqtop/-/archive/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/irqtop-0.3.1_remove_Werror.patch" )

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
}
