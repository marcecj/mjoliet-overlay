# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils systemd

DESCRIPTION="Standalone MPD Web GUI written in C, utilizing Websockets and Bootstrap/JS"
HOMEPAGE="https://www.ympd.org/ https://github.com/notandy/ympd"
SRC_URI="https://github.com/notandy/ympd/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND="media-libs/libmpdclient"
RDEPEND="${DEPEND}"

DOCS=( "README.md" )

src_install() {
	default

	doman ympd.1

	if use systemd; then
		systemd_dounit contrib/ympd.service
		insinto /etc/default
		doins contrib/ympd.default
	fi
}
