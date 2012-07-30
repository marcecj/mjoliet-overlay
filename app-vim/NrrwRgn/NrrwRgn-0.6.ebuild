# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: A Narrow Region Plugin similar to Emacs"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id="
LICENSE="vim"
KEYWORDS="~amd64"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=12938 -> ${P}.vba"

# VIM_PLUGIN_HELPFILES=""
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"

src_unpack() {
	cp ${DISTDIR}/${A} ${S}/${A}
}

# src_install() {
# }
