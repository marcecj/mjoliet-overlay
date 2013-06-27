# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Ncurses RSS client"
HOMEPAGE="http://www.codezen.org/canto/"
SRC_URI="http://codezen.org/static/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses[unicode]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
