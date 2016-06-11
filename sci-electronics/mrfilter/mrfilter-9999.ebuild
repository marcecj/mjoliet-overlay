# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit mercurial python distutils

DESCRIPTION="An active filter design assistant."
HOMEPAGE="http://mrfilter.sourceforge.net"
EHG_REPO_URI="http://mrfilter.hg.sourceforge.net:8000/hgroot/mrfilter/mrfilter"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sci-electronics/geda
>=x11-libs/gtk+-2.16
media-gfx/pstoedit
media-gfx/skencil"
DEPEND="${RDEPEND}
dev-util/scons"

S="${WORKDIR}/${PN}"

src_unpack() {
	mercurial_fetch
	# mercurial_src_unpack
}
