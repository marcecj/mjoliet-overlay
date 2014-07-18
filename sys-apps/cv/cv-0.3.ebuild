# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base

DESCRIPTION="Linux tool to show progress for cp, rm, dd, ..."
HOMEPAGE="https://github.com/Xfennec/cv"
SRC_URI="https://github.com/Xfennec/cv/archive/v0.3.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}_makefile_fix_install.patch" )
DOCS=( "README.md" )

src_install() {
	base_src_install PREFIX="${ED}usr"
}
