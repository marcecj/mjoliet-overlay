# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit udev

DESCRIPTION="Set screen backlight brightness dependent on power source type."
HOMEPAGE="https://github.com/Gen2ly/power-backlight"
SRC_URI="https://github.com/Gen2ly/power-backlight/archive/0.82.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	virtual/udev"

DOCS="readme.md"

src_install() {
	default

	udev_dorules *.rules

	insinto /etc/default
	doins power-backlight.conf

	sed -i 's:/usr/bin/bash:/bin/bash:g' power-backlight || die "sed failed"
	dobin power-backlight
}
