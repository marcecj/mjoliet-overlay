# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [ "${ARCH}" = "amd64" ] ; then
		LNXARCH="linux-x86_64"
else
		LNXARCH="linux-i686"
fi
MY_PN="Zotero"
MY_P="${MY_PN}-${PV}"

RESTRICT="mirror strip"

inherit eutils

DESCRIPTION="A tool to help you collect, organize, cite, and share your research sources."
HOMEPAGE="https://www.zotero.org/"
SRC_URI="https://download.zotero.org/client/release/${PV}/${MY_P}_${LNXARCH}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}_${LNXARCH}"

ZOTERO_INSTALL_DIR="/opt/${PN}"

src_install() {
	# install zotero files to /opt/zotero
	dodir ${ZOTERO_INSTALL_DIR}
	cp -a "${S}"/. "${D}${ZOTERO_INSTALL_DIR}" || die "Installing files failed"

	# sym link /opt/zotero/zotero to /opt/bin/zotero
	dosym ${ZOTERO_INSTALL_DIR}/zotero /opt/bin/zotero

	newicon -s 48 chrome/icons/default/default48.png zotero.png
	newicon chrome/icons/default/default48.png zotero.png
	newicon -s 32 chrome/icons/default/default32.png zotero.png
	newicon -s 16 chrome/icons/default/default16.png zotero.png
	make_desktop_entry "/opt/bin/zotero" Zotero zotero Science
}
