# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

RESTRICT="mirror"

inherit git autotools

DESCRIPTION="Experimental gnucap modifications (compiles gnucap as a library)"
HOMEPAGE="https://github.com/henjo/gnucap"
EGIT_REPO_URI="git://github.com/henjo/gnucap.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
