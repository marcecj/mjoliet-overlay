# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

inherit vim-plugin

DESCRIPTION="python.vim : Enhanced version of the python syntax highlighting script"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=790"

LICENSE="vim"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=12804 -> ${P}.vim"

S=${WORKDIR}
src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}/${PN}.vim"
}

src_install() {
	mv ${PN}.vim  python.vim || die "couldn't rename ${PN}.vim"
	insinto /usr/share/vim/vimfiles/syntax
	doins python.vim || die "doins failed"
}

VIM_PLUGIN_HELPFILES=""
