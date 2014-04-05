# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit distutils vim-plugin

DESCRIPTION="Ropevim is a plugin for performing python refactorings in vim. It uses rope library."
HOMEPAGE="http://rope.sourceforge.net/ropevim.html"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="mirror://pypi/r/${PN}/${P}.tar.gz"

# VIM_PLUGIN_HELPFILES="docs/ropevim.txt"
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

DEPEND="dev-lang/python
	dev-python/rope
	dev-python/ropemode"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's:vim/plugin:vim/vimfiles/plugin:g'
}

src_install() {
	distutils_src_install
}
