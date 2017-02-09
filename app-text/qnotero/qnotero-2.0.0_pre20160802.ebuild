# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1 git-r3

DESCRIPTION="Qnotero provides lightning quick access to your Zotero references."
HOMEPAGE="http://www.cogsci.nl/software/qnotero https://github.com/smathot/qnotero"
EGIT_REPO_URI="https://github.com/smathot/qnotero.git"
EGIT_COMMIT="4f0b4171188c650abfb8671c809c54576d9b480c"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/PyQt5"
RDEPEND="${DEPEND}"
