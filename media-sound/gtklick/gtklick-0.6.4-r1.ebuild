# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

RESTRICT="mirror"

PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils distutils-r1

DESCRIPTION="A simple metronome with an easy-to-use GTK interface."
HOMEPAGE="http://das.nasophon.de/gtklick/"
SRC_URI="http://das.nasophon.de/download/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/klick[osc]
	media-libs/pyliblo[${PYTHON_USEDEP}]
	dev-python/pygtk[${PYTHON_USEDEP}]
	${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

python_prepare_all() {
	epatch "${FILESDIR}/01-gtklick_launcher.patch"
}

python_install_all() {
	dodoc README NEWS
}
