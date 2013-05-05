# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_P="${P/scikits_/scikits.}"

DESCRIPTION="Talkbox, a set of python modules for speech/signal processing"
HOMEPAGE="http://www.ar.media.kyoto-u.ac.jp/members/david/softwares/talkbox/index.html http://pypi.python.org/pypi/scikits.talkbox/"
SRC_URI="mirror://pypi/s/scikits.talkbox/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa"

RDEPEND=">=dev-python/numpy-1.0
	sci-libs/scikits"
DEPEND="${RDEPEND}
	>=sci-libs/scipy-0.6
	dev-python/setuptools"

S="${WORKDIR}/${MY_P}"

src_install(){
	distutils_src_install
	# taken from other scikits ebuilds
	remove_scikits() {
		rm -f "${ED}"$(python_get_sitedir)/scikits/__init__.py || die
	}
	python_execute_function -q remove_scikits
}

