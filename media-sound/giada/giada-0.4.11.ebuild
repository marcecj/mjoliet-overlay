# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

inherit flag-o-matic

DESCRIPTION="Giada is a free, minimal, hardcore audio tool for djs and live performers."
HOMEPAGE="http://www.monocasual.com/giada/"
SRC_URI="http://www.monocasual.com/giada/download.php?dist=source&file=${P/-/_}_src.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vst"

DEPEND="media-libs/rtaudio
  vst? ( media-libs/vst-sdk )"
RDEPEND="${DEPEND}"

S="$WORKDIR"

src_configure() {
	append-cppflags "-I$(fltk-config --includedir)"
	append-ldflags "-L$(fltk-config --libs | xargs dirname)"

	myeconf="--target=linux"
	if use vst; then
		myeconf="$myeconf --enable-vst"
	fi
	if use pulseaudio; then
		myeconf="$myeconf --enable-pulse"
	fi

	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" econf ${myeconf}
}
