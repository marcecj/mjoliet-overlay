# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit git-r3 vim-plugin

DESCRIPTION="vim plugin: Use of Clang for completing C, C++, Objective-C and Objective-C++"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=3302"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""
EGIT_REPO_URI="git://github.com/Rip-Rip/clang_complete.git"
EGIT_COMMIT="v1.8"
unset SRC_URI

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPEND="sys-devel/clang"

src_prepare() {
	rm "${S}/Makefile"
}