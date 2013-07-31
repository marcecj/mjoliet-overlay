# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
PYTHON_COMPAT=( python{2_5,2_6,2_7} )
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1 vim-plugin

DESCRIPTION="Ropevim is a plugin for performing python refactorings in vim. It uses rope library."
HOMEPAGE="http://rope.sourceforge.net/ropevim.html"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://sourceforge.net/projects/rope/files/${PN}/${PV}/${P}.tar.gz/download
-> ${P}.tar.gz"

# VIM_PLUGIN_HELPFILES="docs/ropevim.txt"
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

DEPEND="dev-python/rope[${PYTHON_USEDEP}]
	|| ( app-editors/vim[${PYTHON_USEDEP}]
		 app-editors/gvim[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/vim/vimfiles/plugin/
	doins ropevim.vim

	distutils-r1_src_install
}
