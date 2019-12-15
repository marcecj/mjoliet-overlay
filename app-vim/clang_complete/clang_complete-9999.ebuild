# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit git-r3 vim-plugin

DESCRIPTION="vim plugin: Use of Clang for completing C, C++, Objective-C and Objective-C++"
HOMEPAGE="https://www.vim.org/scripts/script.php?script_id=3302"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""
EGIT_REPO_URI="https://github.com/Rip-Rip/clang_complete.git"
unset SRC_URI

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPEND="sys-devel/clang"

src_prepare() {
	default

	rm "${S}/Makefile"
}
