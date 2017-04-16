# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
PYTHON_COMPAT=( python2_7 )
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1 vim-plugin

DESCRIPTION="A plugin for performing python refactorings in vim. It uses rope library."
HOMEPAGE="https://rope.sourceforge.net/ropevim.html"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="mirror://pypi/r/${PN}/${P}.tar.gz"

# VIM_PLUGIN_HELPFILES="docs/ropevim.txt"
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

DEPEND="dev-python/rope[${PYTHON_USEDEP}]
	dev-python/ropemode[${PYTHON_USEDEP}]
	|| ( app-editors/vim[${PYTHON_USEDEP}]
		 app-editors/gvim[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's:vim/plugin:vim/vimfiles/plugin:g'
}

src_install() {
	distutils-r1_src_install
}