# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

# FIXME: - add examples use flag
RESTRICT="mirror"

inherit eutils

DESCRIPTION="The Next Generation Spice (Electronic Circuit Simulator)."
SRC_URI="mirror://sourceforge/ngspice/ng-spice-rework-${PV}.tar.gz
	doc? ( http://users.ece.gatech.edu/~mrichard/Xspice/Xspice_Users_Manual.pdf \
		http://users.ece.gatech.edu/~mrichard/Xspice/XSpice_SoftwareDesignDoc_Sep92.pdf \
		http://users.ece.gatech.edu/~mrichard/Xspice/XSpice_InterfaceDesignDoc_Sep92.pdf \
		http://users.ece.gatech.edu/~mrichard/Xspice/XSpice_CodeModelSubsysSoftwareDesign.pdf \
		http://users.ece.gatech.edu/~mrichard/Xspice/XSpice_CodeModelSubsysInterfaceDesign.pdf )"
HOMEPAGE="http://ngspice.sourceforge.net"
LICENSE="BSD GPL-2"

SLOT="0"
IUSE="X tcl debug doc readline"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

# X is supposed to be disabled with --no-x automatically...
DEPEND="
	readline? ( >=sys-libs/readline-5.0:5 )
	tcl? (
		dev-lang/tcl:*
		dev-lang/tk:*
		>=dev-tcltk/blt-2.4z-r8
	)
	!tcl? ( X? (
		x11-libs/libXaw
		x11-libs/libXt
		x11-libs/libX11
		sci-visualization/xgraph
	) )
	"
RDEPEND="${DEPEND}"

pkg_setup() {
# TODO: is there really necessary?
	if use X && use tcl ; then
		eerror "TCLSpice is incompatible with the X code in NGSpice!"
		eerror "NGSpice should automatically be configured with --no-x, but for"
		eerror "some reason (PEBKAC?), it does not."
		die "Set either tcl *or* X use flags!"
	fi
}

src_prepare() {
	# TODO: I saw no difference in CFLAGS, perhaps the sed regexp needs to change?
	# sed -i -e 's/CFLAGS=" "/CFLAGS="\${CFLAGS}"/' configure
	if use doc ; then
		cp "${DISTDIR}"/Xspice_Users_Manual.pdf "${S}"
		cp "${DISTDIR}"/XSpice_SoftwareDesignDoc_Sep92.pdf "${S}"
		cp "${DISTDIR}"/XSpice_InterfaceDesignDoc_Sep92.pdf "${S}"
		cp "${DISTDIR}"/XSpice_CodeModelSubsysSoftwareDesign.pdf "${S}"
		cp "${DISTDIR}"/XSpice_CodeModelSubsysInterfaceDesign.pdf "${S}"
	fi
}

src_configure() {
	local MYCONF
	if use debug ; then
		MYCONF="--enable-debug \
			--enable-ftedebug \
			--enable-cpdebug \
			--enable-asdebug \
			--enable-stepdebug \
			--enable-pzdebug"
	else
		MYCONF="--disable-debug \
			--disable-ftedebug \
			--disable-cpdebug \
			--disable-asdebug \
			--disable-stepdebug \
			--disable-pzdebug"
	fi
	# TODO: Is this still true?
	# Those don't compile
	MYCONF="${MYCONF} \
		--disable-sensdebug \
		--disable-blktmsdebug \
		--disable-smltmsdebug"
	# FIXME: Will not compile with
	# --disable-dependency-tracking
	econf ${MYCONF} \
		--enable-intnoise \
		--enable-xspice \
		--enable-numparam \
		--enable-dot-global \
		--disable-xgraph \
		--enable-dependency-tracking \
		$(use_with X x) \
		$(use_with readline) \
		$(use_with tcl) \
		|| die "econf failed"
}

src_compile() {
	# tclspice is not parallel make safe
	if use tcl ; then
		emake -j1 || die "failed to emake tclspice"
	else
		emake || die "failed to emake ngspice"
	fi
}

src_install () {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc ANALYSES AUTHORS BUGS ChangeLog DEVICES NEWS \
		README README.tcl Stuarts_Poly_Notes || die "failed to install documentation"

	if use doc ; then
		insinto /usr/share/doc/${PF}
		doins doc/ngspice.pdf
		doins *.pdf
	fi

	# We don't need ngmakeidx to be installed
	rm "${D}"/usr/bin/ngmakeidx
}

src_test () {
	# Bug 108405
	true
}
