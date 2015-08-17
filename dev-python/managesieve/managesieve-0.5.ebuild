# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="A ManageSieve client library for remotely managing Sieve scripts."
HOMEPAGE="http://python-managesieve.origo.ethz.ch/"
SRC_URI="mirror://pypi/m/managesieve/${P}.tar.bz2"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

src_prepare() {
	# remove unused ez_setup, since ez_setup is not normally installed
	sed -i -e '/ez_setup/d' setup.py || die "sed failed!"
}
