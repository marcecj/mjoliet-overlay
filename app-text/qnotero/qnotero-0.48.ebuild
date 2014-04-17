# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Qnotero provides lightning quick access to your Zotero references."
HOMEPAGE="http://www.cogsci.nl/software/qnotero https://github.com/smathot/qnotero"
SRC_URI="http://files.cogsci.nl/software/${PN}/${PN}_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/PyQt4"
RDEPEND="${DEPEND}"
