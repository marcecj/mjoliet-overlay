# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Buttersink is like rsync for btrfs snapshots"
HOMEPAGE="https://github.com/AmesCornish/buttersink"
SRC_URI="mirror://pypi/b/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/boto
	dev-python/crcmod
	dev-python/psutil
	sys-fs/btrfs-progs"

src_prepare() {
	# work around missing version.txt; there is a make target for this, but it
	# can only be run from within a git checkout
	echo "${PV}" > version.txt
}
