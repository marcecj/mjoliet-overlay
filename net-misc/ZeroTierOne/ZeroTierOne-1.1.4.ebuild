# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit systemd

DESCRIPTION="Network Virtualization Everywhere"
HOMEPAGE="https://www.zerotier.com/"
SRC_URI="https://github.com/zerotier/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_prepare() {
	sed -i 's:/var/lib/zerotier-one:/usr/bin:g' ext/installfiles/linux/systemd/zerotier-one.service
}

src_install() {
	dobin zerotier-one
	insinto /usr/bin
	doins zerotier-{cli,idtool}
	dodoc "${DOCS[@]}"

	systemd_dounit ext/installfiles/linux/systemd/zerotier-one.service
}
