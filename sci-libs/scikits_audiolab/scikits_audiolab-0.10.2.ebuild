# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="${P/scikits_/scikits.}"

DESCRIPTION="Audiolab is a python package for audio file IO using numpy arrays."
HOMEPAGE="http://www.ar.media.kyoto-u.ac.jp/members/david/softwares/audiolab/ http://pypi.python.org/pypi/scikits.audiolab/"
SRC_URI="mirror://pypi/s/scikits.audiolab/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa"

RDEPEND=">=dev-python/numpy-1.2
	sci-libs/scikits"
DEPEND="${RDEPEND}
	media-libs/libsndfile
	dev-python/setuptools
	alsa? ( media-libs/alsa-lib )"

S="${WORKDIR}/${MY_P}"

src_install(){
	distutils_src_install
	# taken from other scikits ebuilds
	remove_scikits() {
		rm -f "${ED}"$(python_get_sitedir)/scikits/__init__.py || die
	}
	python_execute_function -q remove_scikits
}

