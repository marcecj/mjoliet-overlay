# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="btrfs-snap creates and maintains the history of snapshots of btrfs filesystems."
HOMEPAGE="https://github.com/jf647/btrfs-snap"
SRC_URI="https://github.com/jf647/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl
	sys-fs/btrfs-progs"

src_install() {
	dobin btrfs-snap
	dodoc README.md CHANGELOG.md
}
