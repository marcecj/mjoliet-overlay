# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

inherit vim-plugin git-2

DESCRIPTION="vim plugin: autoclose various characters, like parantheses"
HOMEPAGE="http://townk.github.com/vim-autoclose/"
EGIT_REPO_URI="https://github.com/Townk/vim-autoclose.git"
unset SRC_URI

LICENSE="vim"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

src_prepare() {
	rm -r "${S}/.git" "$S/.gitignore" || die "rm failed"
}
