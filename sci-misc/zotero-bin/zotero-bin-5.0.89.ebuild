# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

RESTRICT="mirror strip"

inherit desktop eutils

DESCRIPTION="A tool to help you collect, organize, cite, and share your research sources."
HOMEPAGE="https://www.zotero.org/"
BASE_URI="https://download.zotero.org/client/release/${PV}/Zotero-${PV}_linux"
SRC_URI="
	amd64? ( ${BASE_URI}-x86_64.tar.bz2 )
	x86? ( ${BASE_URI}-i686.tar.bz2 )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/dbus-glib
"

if [ "${ARCH}" = "amd64" ] ; then
	S="${WORKDIR}/Zotero_linux-x86_64"
else
	S="${WORKDIR}/Zotero_linux-i686"
fi

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