# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="mirror"

LANGS="en fr"

inherit qt4-r2

MY_S=${PN}${PV}

DESCRIPTION="A simple QT/JACK application that lets you change MIDI-keyboard velocity response."
HOMEPAGE="http://sourceforge.net/projects/qmidicurves/"
SRC_URI="http://sourceforge.net/projects/qmidicurves/files/${PN}/${PV}/${MY_S}.tar.gz/download -> ${MY_S}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

export S="${WORKDIR}/${MY_S}"
export pro_file="${PN}.pro"

DEPEND="x11-libs/qwt:5
		x11-libs/qt-core
		x11-libs/qt-gui"
RDEPEND="${DEPEND}"

DOCS="README RELEASES"

src_prepare() {
	# fixes to the project file
	sed -i -s "s:/usr/local:/usr:g" $pro_file
	sed -i -s "s:-lqwt-qt4:-lqwt:g" $pro_file

	# correct the qwt includes
	sed -i -s "s:qwt-qt4:qwt5:g" *.h *.cpp

	# create the *.qm resources required by images.qrc
	lrelease $pro_file

	qt4-r2_src_prepare
}

src_install() {
	dobin ${PN}
	qt4-r2_src_install
}