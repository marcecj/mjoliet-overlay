# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )
inherit distutils-r1

DESCRIPTION="A ManageSieve client library for remotely managing Sieve scripts."
HOMEPAGE="http://python-managesieve.origo.ethz.ch/"
SRC_URI="http://download.origo.ethz.ch/python-managesieve/1573/${P}.tar.bz2"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
