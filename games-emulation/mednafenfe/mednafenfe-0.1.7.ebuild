# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_P=mfe-${PV}
DESCRIPTION="A mednafen frontend / launcher"
HOMEPAGE="http://mednafenfe.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="games-emulation/mednafen
	dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}
