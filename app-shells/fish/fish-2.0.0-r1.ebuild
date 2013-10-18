# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-shells/fish/fish-2.0.0.ebuild,v 1.4 2013/09/05 19:24:42 ago Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
inherit base autotools python-r1

DESCRIPTION="fish is the Friendly Interactive SHell"
HOMEPAGE="http://fishshell.com/"
SRC_URI="http://fishshell.com/files/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x86-solaris"
IUSE="lzma xz X"

# The {backports-,}lzma modules implement both lzma and xz, so you can't have
# only one or the other
REQUIRED_USE="lzma? ( xz )
			  !lzma? ( !xz )"

DEPEND="${PYTHON_DEPS}
	sys-libs/ncurses
	sys-devel/bc
	sys-devel/gettext
	www-client/htmlview
	X? ( x11-misc/xsel )"
RDEPEND="${DEPEND}
	lzma? ( || (
				$(python_gen_cond_dep dev-python/backports-lzma python{2_6,2_7,3_2})
				$(python_gen_useflags python{3_3})
				) )
	"

S="${WORKDIR}/${PN}"

src_prepare() {
	eautoreconf
	epatch "${FILESDIR}"/fish-2.0.0_support_bzip2_lzma_xz_manpages.patch
}

src_configure() {
	# Set things up for fish to be a default shell.
	# It has to be in /bin in case /usr is unavailable.
	# Also, all of its utilities have to be in /bin.
	econf \
		docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--bindir="${EPREFIX}"/bin
}

pkg_postinst() {
	elog "fish is now installed on your system."
	elog "To run fish, type 'fish' in your terminal."
	elog
	elog "To use fish as your login shell:"
	elog "* add the line '${EPREFIX}/bin/${PN}'"
	elog "* to the file '${EPREFIX}/etc/shells'."
	elog "* use the command 'chsh -s ${EPREFIX}/bin/${PN}'."
	elog
	elog "To set your colors, run 'fish_config'"
	elog "To scan your man pages for completions, run 'fish_update_completions'"
	elog "To autocomplete command suggestions press Ctrl + F or right arrow key."
	elog
	elog "Have fun!"
}
