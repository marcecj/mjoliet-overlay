# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/gprof2dot/gprof2dot-0_p20100216.ebuild,v 1.4 2012/03/15 20:16:55 sping Exp $

EAPI="5"
PYTHON_COMPAT=( python2_{5,6,7} python3_{2,3} )
PYTHON_REQ_USE="xml"

inherit python-r1 git-2

DESCRIPTION="Converts profiling output to dot graphs"
HOMEPAGE="http://code.google.com/p/jrfonseca/wiki/Gprof2Dot"
EGIT_REPO_URI="https://code.google.com/p/jrfonseca.gprof2dot"
EGIT_COMMIT="6dd89f101f7d"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	exeinto "/usr/bin/"
	doexe "${PN}.py"
	python_replicate_script "${ED}usr/bin/${PN}.py"
}
