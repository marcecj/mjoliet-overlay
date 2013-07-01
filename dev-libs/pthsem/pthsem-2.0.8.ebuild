# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="extended version of GNU pth (user mode multi threading library)"
HOMEPAGE="http://www.auto.tuwien.ac.at/~mkoegler/index.php/pth"
SRC_URI="http://www.auto.tuwien.ac.at/~mkoegler/pth/pthsem_${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	make DESTDIR="${D}" install || die
	dodoc ANNOUNCE AUTHORS ChangeLog NEWS README THANKS USERS
}
