# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

inherit python-distutils-ng

PYTHON_COMPAT="python2_5 python2_6 python2_7"
DESCRIPTION="A simple metronome with an easy-to-use GTK interface."
HOMEPAGE="http://das.nasophon.de/gtklick/"
SRC_URI="http://das.nasophon.de/download/gtklick-0.6.4.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/klick[osc]
		media-libs/pyliblo
		dev-python/pygtk"
RDEPEND="${DEPEND}"

python_install_all() {
	dodoc README NEWS
}
