# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="An inkscape extension that embeds re-editable LaTeX objects in SVG drawings"
HOMEPAGE="https://bitbucket.org/pitgarbe/textext"
SRC_URI="https://bitbucket.org/pitgarbe/${PN}/downloads/TexText-Linux-${PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND=">=media-gfx/inkscape-0.48[${PYTHON_USEDEP}]
	virtual/latex-base
	app-text/ghostscript-gpl
	media-gfx/pstoedit[plotutils]
	dev-python/pygtksourceview[${PYTHON_USEDEP}]
	virtual/imagemagick-tools[svg]"
DEPEND=""

S="${WORKDIR}/${P}-linux"

src_install() {
	exeinto /usr/share/inkscape/extensions
	doexe extension/*.py

	insinto /usr/share/inkscape/extensions
	doins extension/*.inx extension/*.tex
}
