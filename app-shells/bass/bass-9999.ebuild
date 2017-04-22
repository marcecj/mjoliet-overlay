# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
inherit git-r3 python-r1

DESCRIPTION="Make Bash utilities usable in Fish shell"
HOMEPAGE="https://github.com/edc/bass"
EGIT_REPO_URI="https://github.com/edc/bass.git"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/fish"
RDEPEND="${DEPEND}
	${PYTHON_DEPS}"

src_prepare() {
	default

	# the Makefile is intended for per-user installation
	rm Makefile
}

src_install() {
	insinto /usr/share/fish/vendor_functions.d/
	doins functions/*
	dodoc README.md
}