# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin git-2

DESCRIPTION="vim plugin: "
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2905"
LICENSE="vim.org"
KEYWORDS="~amd64"
EGIT_REPO_URI="git://github.com/MarcWeber/vim-addon-manager.git"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPENDS="
	|| ( net-misc/curl net-misc/wget )
"

src_install() {
	dodoc autoload/sample_vimrc_for_new_users.vim
	rm -f autoload/sample_vimrc_for_new_users.vim
	vim-plugin_src_install
}

pkg_postinst() {
	vim-plugin_pkg_postinst

	elog "Depending on the vim addons you want to install, you might need any"
	elog "of the following:"
	elog
	elog "    dev-vcs/git"
	elog "    dev-vcs/mercurial"
	elog "    dev-vcs/subversion"
	elog "    dev-vcs/bzr"
	elog "    dev-vcs/darcs"
	elog "    app-arch/tar"
	elog "    app-arch/zip"
	elog "    app-arch/gzip"
	elog "    app-arch/p7zip"
}
