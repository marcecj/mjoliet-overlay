# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

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
	default

	# prevent the build system from pre-stripping the files
	sed -i -e '/STRIP/d' make-linux.mk || die "sed failed"
}

src_install() {
	default

	doman doc/zerotier-*.?

	systemd_dounit debian/zerotier-one.service
}
