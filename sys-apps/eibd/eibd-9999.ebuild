# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit autotools python-r1 user git-2

DESCRIPTION="Provides an interface to the EIB / KNX bus"
HOMEPAGE="http://www.auto.tuwien.ac.at/~mkoegler/index.php/eibd"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="eibd ft12 pei16 tpuart pei16s tpuarts eibnetip eibnetiptunnel eibnetipserver
usb groupcache php python java tools"

DEPEND="dev-libs/pthsem"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
	php? ( virtual/php )
"

EGIT_REPO_URI="git://bcusdk.git.sourceforge.net/gitroot/bcusdk/bcusdk"

S="${WORKDIR}/bcusdk-${PV}"

src_prepare() {
	if [[ $PV == "9999" ]]; then
		eautoreconf
	fi
}
src_configure() {
	econf \
		--enable-onlyeibd \
		$(use_enable ft12) \
		$(use_enable pei16) \
		$(use_enable tpuart) \
		$(use_enable pei16s) \
		$(use_enable tpuarts) \
		$(use_enable eibnetip) \
		$(use_enable eibnetiptunnel) \
		$(use_enable eibnetipserver) \
		$(use_enable usb) \
		$(use_enable groupcache) || die "econf failed"
}

src_install() {
	if use eibd; then
		emake DESTDIR="${D}" install || die "emake install failed"
		doinitd "${FILESDIR}"/init.d/eibd
		doconfd "${FILESDIR}"/conf.d/eibd
	fi

	if use python; then
		einfo "Installing python module"
		cd ./eibd/client/python
		emake DESTDIR="${D}" install || die "could not install python module"
	fi
}

pkg_preinst() {
	enewuser eibd
	enewgroup eibd
}
