# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
# FIXME: damn it, this is some weird mixture of python and vim code, some of
# which uses distutils to install.
inherit vim-plugin distutils eutils

DESCRIPTION="Ropevim is a plugin for performing python refactorings in vim. It uses rope library."
HOMEPAGE="http://rope.sourceforge.net/ropevim.html"
LICENSE="GPL"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://sourceforge.net/projects/rope/files/${PN}/${PV}/${P}.tar.gz/download
-> ${P}.tar.gz"

# VIM_PLUGIN_HELPFILES="docs/ropevim.txt"
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

DEPEND="dev-lang/python
dev-python/rope"

src_install() {
	insinto /usr/share/vim/vimfiles/plugin/
	doins ropevim.vim

	distutils_src_install
}
