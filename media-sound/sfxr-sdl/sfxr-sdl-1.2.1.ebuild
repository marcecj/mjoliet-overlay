# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
RESTRICT="mirror"

DESCRIPTION="sound effect generator"
HOMEPAGE="http://drpetter.se/project_sfxr.html"
SRC_URI="http://drpetter.se/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="x11-libs/gtk+:3
	media-libs/libsdl"
RDEPEND="${DEPEND}"

