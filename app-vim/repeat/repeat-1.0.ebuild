# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: use the repeat command (.) with supported plugins"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2136"
LICENSE="vim"
KEYWORDS="~amd64"
IUSE=""
# SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=8206 -> repeat.vim"
SRC_URI="https://github.com/tpope/vim-repeat/zipball/v1.0 -> ${P}.zip"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"/tpope-vim-repeat-5d06a55
