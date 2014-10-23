# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="${P/scikits_/scikits.}"

DESCRIPTION="A python module for high quality audio resampling."
HOMEPAGE="http://www.ar.media.kyoto-u.ac.jp/members/david/softwares/samplerate/ http://pypi.python.org/pypi/scikits.samplerate/"
SRC_URI="mirror://pypi/s/scikits.samplerate/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/numpy-1.2[${PYTHON_USEDEP}]
	sci-libs/scikits[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	media-libs/libsamplerate
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

src_install(){
	distutils-r1_src_install
	# taken from other scikits ebuilds
	remove_scikits() {
		rm -f "${ED}"$(python_get_sitedir)/scikits/__init__.py || die
	}
	python_parallel_foreach_impl remove_scikits
}
