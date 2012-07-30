# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

RESTRICT="mirror"

EAPI="2"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id="
LICENSE=""
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=12812 -> ${P}.vim"

# VIM_PLUGIN_HELPFILES=""
# VIM_PLUGIN_HELPTEXT=""
# VIM_PLUGIN_HELPURI=""
# VIM_PLUGIN_MESSAGES=""

S="${WORKDIR}"
src_unpack() {
	cp ${DISTDIR}/${A} ${WORKDIR}/${PN}.vim
}

src_install() {
	insinto /usr/share/vim/vimfiles/ftplugin
	doins ${PN}.vim || die "doins failed"
}
