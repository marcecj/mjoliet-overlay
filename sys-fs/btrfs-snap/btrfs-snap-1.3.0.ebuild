# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="btrfs-snap creates and maintains the history of snapshots of btrfs filesystems."
HOMEPAGE="https://github.com/jf647/btrfs-snap"

EGIT_REPO_URI="https://github.com/jf647/btrfs-snap.git"
EGIT_COMMIT="c542ead1c8c97a4ae09590a53ecce67667581cb2"

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
