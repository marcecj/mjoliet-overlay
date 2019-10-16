# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils systemd

DESCRIPTION="A remote shell that automatically reconnects without interrupting the session."
HOMEPAGE="https://eternalterminal.dev/"
SRC_URI="https://github.com/MisterTea/EternalTerminal/archive/et-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# TODO: deal with selinux support
IUSE=""

RDEPEND="dev-cpp/gflags
	dev-libs/boost
	dev-libs/libsodium
	dev-libs/protobuf
	sys-libs/ncurses"
DEPEND="${RDEPEND}
	dev-util/cmake"

# TODO: file a bug upstream (the ninja build system does not build the Protobuf
# headers first, causing the build to fail early).
CMAKE_MAKEFILE_GENERATOR="emake"

S="${WORKDIR}/EternalTerminal-et-v${PV}"

src_install() {
	default
	insinto /etc/
	doins etc/et.cfg
	cmake-utils_src_install
	systemd_dounit systemctl/et.service
}
