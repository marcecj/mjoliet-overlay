# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
RESTRICT="mirror"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P="${P/scikits_/scikits.}"

DESCRIPTION="Audiolab is a python package for audio file IO using numpy arrays."
HOMEPAGE="http://www.ar.media.kyoto-u.ac.jp/members/david/softwares/audiolab/ http://pypi.python.org/pypi/scikits.audiolab/"
SRC_URI="mirror://pypi/s/scikits.audiolab/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa"

RDEPEND=">=dev-python/numpy-1.2[${PYTHON_USEDEP}]
	sci-libs/scikits[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	media-libs/libsndfile
	dev-python/setuptools[${PYTHON_USEDEP}]
	alsa? ( media-libs/alsa-lib )"

S="${WORKDIR}/${MY_P}"

src_install(){
	distutils-r1_src_install
	# taken from other scikits ebuilds
	remove_scikits() {
		rm -f "${ED}"$(python_get_sitedir)/scikits/__init__.py || die
	}
	python_parallel_foreach_impl remove_scikits
}
