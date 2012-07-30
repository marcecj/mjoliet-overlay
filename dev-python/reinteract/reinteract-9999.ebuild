# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit python git autotools eutils

DESCRIPTION="An interactive Python shell written in PyGtk"
HOMEPAGE="http://www.reinteract.org/"
EGIT_PROJECT="reinteract"
EGIT_REPO_URI="git://git.fishsoup.net/reinteract.git"
EGIT_BRANCH="master"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/numpy
		dev-python/matplotlib
		dev-python/pygtk"
RDEPEND="media-sound/sox"

src_prepare() {
	eautoreconf || die "autoreconf failed"
}

src_configure() {
	econf || die "failed to econf ${PN}"
}

src_compile () {
	emake || die  "failed to emake ${PN}"
}

src_install () {
	emake DESTDIR="${D}" install || "make install failed"
}
