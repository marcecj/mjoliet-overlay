# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Simple top-like interrupt load monitor"
HOMEPAGE="https://github.com/kargig/itop"
SRC_URI="https://github.com/kargig/itop/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl"

src_install() {
	dobin itop
	dodoc README.md
}
