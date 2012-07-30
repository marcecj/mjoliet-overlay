# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils mercurial

DESCRIPTION="textext is an inkscape extension, which embed re-editable LaTeX objects in SVG drawings"
HOMEPAGE="http://www.elisanet.fi/ptvirtan/software/textext/"
EHG_REPO_URI="http://bitbucket.org/pv/textext/"

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
