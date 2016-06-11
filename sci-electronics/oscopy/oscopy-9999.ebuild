# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools python git

DESCRIPTION="An interactive program to view electrical simulation results"
HOMEPAGE="http://repo.or.cz/w/oscopy.git"
EGIT_PROJECT="oscopy"
EGIT_REPO_URI="git://repo.or.cz/oscopy.git"
EGIT_BRANCH="master"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/python
		dev-python/numpy
		dev-python/pyxdg
		dev-python/dbus-python"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_prepare() {
	# epatch ${FILESDIR}/oscopy_gui_module.patch
	eautoreconf
}

src_install() {
	python_enable_pyc
	emake install DESTDIR="${D}" || die "Install failed"
}
