# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Rumpelrausch Taips AZR3 standalone Linux port"
HOMEPAGE="http://ll-plugins.nongnu.org/azr3"
SRC_URI="http://download.savannah.nongnu.org/releases/ll-plugins/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-sound/jack-audio-connection-kit
		dev-cpp/gtkmm
		media-sound/lash"
RDEPEND="${DEPEND}"
