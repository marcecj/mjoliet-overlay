# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

my_PN="PySoundFile"
my_P="${my_PN}-${PV}"
DESCRIPTION="PySoundFile is an audio library based on libsndfile, CFFI, and NumPy"
HOMEPAGE="https://pypi.python.org/pypi/PySoundFile https://github.com/bastibe/PySoundFile"
SRC_URI="mirror://pypi/P/${my_PN}/${my_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${my_P}"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cffi
	dev-python/numpy
	media-libs/libsndfile"
