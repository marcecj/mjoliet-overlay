# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

DESCRIPTION="a wrapper around the standard `ping` tool with prettier and more compact output"
HOMEPAGE="http://denilson.sa.nom.br/prettyping/"
SRC_URI="https://github.com/denilsonsa/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin prettyping
	dodoc README.md
}
