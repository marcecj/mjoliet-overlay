# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit base

DESCRIPTION="irqtop is a simple monitor for /proc/interrupts."
HOMEPAGE="https://gitorious.org/elboulangero/irqtop/"
SRC_URI="https://gitorious.org/elboulangero/${PN}/archive/2a902c5cbc50f79392f0506a6ed8383b05a1bf32.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/elboulangero-irqtop"

PATCHES=( "${FILESDIR}/irqtop-0.3_remove_Werror.patch" )

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
}
