# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python2_7 )

inherit python-r1

DESCRIPTION="An inkscape extension that embeds re-editable LaTeX objects in SVG drawings"
HOMEPAGE="https://textext.github.io/textext/"
SRC_URI="https://github.com/textext/textext/releases/download/${PV}/TexText-Linux-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# NOTE: While textext also still works with ghostscript + pstoedit, it is not
# recommended upstream due to problems with particular version combinations of
# the two (see
# https://textext.github.io/textext/install/linux.html#linux-install-pdf-to-svg-converter
# and the issues referenced there), and I do not want to deal with that version
# specification mess.  Furthermore, according to upstream, pdf2svg produces
# better SVG output.
RDEPEND="${PYTHON_DEPS}
	dev-python/pygtk[${PYTHON_USEDEP}]
	dev-python/pygtksourceview[${PYTHON_USEDEP}]
	=media-gfx/inkscape-0.92*[${PYTHON_USEDEP}]
	media-gfx/pdf2svg
	virtual/latex-base"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/inkscape/extensions
	doins -r extension/*
}
