# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit autotools eutils flag-o-matic versionator

DESCRIPTION="Realtime multimedia environment and additional plugins"
HOMEPAGE="http://www.puredata.info"
SRC_URI="http://sourceforge.net/projects/pure-data/files/${PN}/${PV}/Pd-extended_${PV}-source.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# oscx is deprecated by the mrpeach external
# FIXME: the following don't compile on my system at configure time, so are
# deactivated by default: pdp, pidip, gem2pdp, iem16, pdp_opengl, zexy
IUSE_PD_EXTERNALS="apple arraysize +bassemu +boids +bsaylor chaos +creb +cxc
	+earplug +ekext +ext13 +flatgui +freeverb +ggee grh
	+hcs +iemlib jasch_lib +loaders-hexloader +loaders-libdir +loaders-tclpd
	-loaders-pdlua log +mapping +markex +maxlib miXed
	+mjlib +moocow +moonlib +motex +mrpeach +pan +pdcontainer +pddp +pdogg
	pduino +plugin +pmpd +sigpack +smlib testtools +tof unauthorized +vanilla
	+vbap +windowing
	+hid -pdp -pidip -gem2pdp -iem16 -pdp_opengl -postlude
	-oscx -zexy"
IUSE="+alsa debug fftw +jack portaudio ${IUSE_PD_EXTERNALS}"

DEPEND="dev-lang/tcl
	dev-lang/tk
	media-libs/flac
	media-sound/lame
	media-libs/ladspa-sdk
	media-libs/libsndfile
	alsa? ( media-libs/alsa-lib )
	fftw? ( sci-libs/fftw )
	hcs? ( dev-libs/libusb )
	jack? ( media-sound/jack-audio-connection-kit )
	loaders-pdlua? ( dev-lang/lua )
	pdogg? ( media-libs/libogg
		media-libs/libvorbis )
	portaudio? ( media-libs/portaudio )
	unauthorized? ( media-libs/speex
		media-sound/lame )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}/"

src_prepare() {
	cd "${S}/pd"
	epatch "${FILESDIR}/link-with-alsa.patch"
	epatch "${FILESDIR}/fix-pd-path.patch"
	eautoreconf
}

src_configure() {
	cd "${S}/pd"
	econf \
		$(use_enable alsa) \
		$(use_enable jack) \
		$(use_enable debug) \
		$(use_enable fftw) \
		$(use_enable portaudio)
}

src_compile() {
	cd "${S}/pd"
	emake

	# build externals in $IUSE
	cd "${S}/externals"
	for external_useflag in ${IUSE_PD_EXTERNALS}; do
		local external=${external_useflag#[+-]}
		if use ${external}; then
			elog "Building external '${external}'"
			local my_make_opts=""
			case ${external} in
			oscx|unauthorized|zexy)
				# fails to build with parallel make
				my_make_opts="${my_make_opts} -j1"
				;;
			esac
			emake OPT_CFLAGS="${CFLAGS} -fPIC -DPIC" DESTDIR="${D}" prefix="/usr" \
				${my_make_opts} ${external} || die "${external} failed"
		fi
	done
}

src_install() {
	# install pd-extended
	cd "${S}/pd/src"
	emake DESTDIR="${D}" prefix="/usr" install

	# install private headers for developers
	insinto /usr/include/pdextended || die "can't insinto"
	doheader m_pd.h m_imp.h g_canvas.h s_stuff.h g_all_guis.h || die "no doheader"

	# install built-in documentation
	cd "${S}/pd"
	emake DESTDIR="${D}" prefix="/usr" install-data-am

	# install externals
	cd "${S}/externals"
	for external_useflag in ${IUSE_PD_EXTERNALS}; do
		local external=${external_useflag#[+-]}
		if use ${external}; then
			elog "Installing external '${external}'"
			emake DESTDIR="${D}" prefix=/usr ${external}_install || \
				die "install '${external}' failed"
		fi
	done

	newicon ${S}/packages/linux_make/pd-extended.png pd-extended.png
	domenu ${FILESDIR}/${PN}.desktop

	insinto /usr/lib/pd
	doins -r ${S}/pd/tcl
}
