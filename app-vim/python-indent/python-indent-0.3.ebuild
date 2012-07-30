# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

RESTRICT="mirror"

EAPI="2"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: This indentation script for python tries to match more closely what is suggested in PEP 8."
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=974"
LICENSE=""
KEYWORDS="~amd64"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=4316 -> ${P}.vim"

S="${WORKDIR}"

src_unpack() {
	cp ${DISTDIR}/${A} ${WORKDIR}/python.vim
}

src_install() {
	insinto /usr/share/vim/vimfiles/indent
	doins python.vim || die "doins failed"
}

# VIM_PLUGIN_HELPFILES=""
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

