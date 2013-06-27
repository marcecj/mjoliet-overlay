# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2} )
inherit eutils distutils-r1

DESCRIPTION="A Python wrapper for the liblo OSC library"
HOMEPAGE="http://das.nasophon.de/${PN}"
SRC_URI="http://das.nasophon.de/download/${P}.tar.gz \
	https://launchpad.net/~artfwo/+archive/ppa/+files/${PN}_${PV}-2ubuntu1%7Enatty1.debian.tar.gz"
	# patch required until upstream includes this code

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-libs/liblo-0.26"
DEPEND="${RDEPEND}
	dev-python/cython"

python_prepare_all() {
	EPATCH_SOURCE="${WORKDIR}/debian/patches"
	epatch
}
