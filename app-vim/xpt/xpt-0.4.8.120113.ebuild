# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: XP's Snippet Template engine for vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2611"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=17190
	-> ${P}-ac4a53d.tar.gz"

# install xpt in $VIMRUNTIME/vimfiles instead of in subdir xpt/
S="${WORKDIR}"

VIM_PLUGIN_HELPFILES="xptemplate.txt"
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""
