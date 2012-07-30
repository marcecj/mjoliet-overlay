# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Use of Clang for completing C, C++, Objective-C and Objective-C++"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=3302"
LICENSE=""
KEYWORDS="~amd64"
IUSE=""
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=14558 -> clang_complete-${PV}.vim"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPEND="sys-devel/clang"

src_unpack() {
	mkdir -p "${S}/plugin"
	cp "${DISTDIR}/${A}"  "${S}/plugin"
}
