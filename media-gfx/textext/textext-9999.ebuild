# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils mercurial

DESCRIPTION="An inkscape extension that embeds re-editable LaTeX objects in SVG drawings"
HOMEPAGE="http://pav.iki.fi/software/textext/"
EHG_REPO_URI="https://bitbucket.org/pv/textext/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=media-gfx/inkscape-0.46
	virtual/latex-base
	|| ( media-gfx/pdf2svg media-gfx/pstoedit[plotutils] )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	exeinto /usr/share/inkscape/extensions
	doexe *.py || die "doexe failed. Can't copy script to extensions folder"

	insinto /usr/share/inkscape/extensions
	doins *.inx || die "doins faild. Can't copy script to extensions folder"
}
