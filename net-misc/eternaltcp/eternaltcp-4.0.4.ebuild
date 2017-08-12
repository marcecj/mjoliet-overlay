# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A remote shell that automatically reconnects without interrupting the session."
HOMEPAGE="https://mistertea.github.io/EternalTCP/"
SRC_URI="https://github.com/MisterTea/EternalTCP/archive/et-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# TODO: deal with selinux support
IUSE=""

RDEPEND="dev-cpp/glog
	dev-cpp/gflags
	dev-libs/boost
	dev-libs/libsodium
	dev-libs/protobuf
	sys-libs/ncurses:5"
DEPEND="${DEPEND}
	dev-util/cmake"

S="${WORKDIR}/EternalTCP-et-v${PV}"
