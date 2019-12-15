# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

RESTRICT="mirror"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Use of Clang for completing C, C++, Objective-C and Objective-C++"
HOMEPAGE="https://www.vim.org/scripts/script.php?script_id=3302"
LICENSE="BSD"
KEYWORDS="~amd64"
IUSE=""
SRC_URI="https://github.com/xavierd/clang_complete/archive/v${PV}.tar.gz -> ${P}.tar.gz"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPEND="sys-devel/clang"

src_prepare() {
	rm "${S}/Makefile"
}
