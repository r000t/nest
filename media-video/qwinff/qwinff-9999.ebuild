# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"

inherit desktop git-r3 qmake-utils optfeature virtualx

DESCRIPTION="Qt GUI Frontend for FFmpeg"
HOMEPAGE="https://github.com/qwinff/qwinff"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="libnotify"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtwidgets:5
	x11-libs/libnotify"
RDEPEND="${DEPEND}
	media-video/ffmpeg:0="
BDEPEND="dev-qt/linguist-tools:5
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}/${PN}"-0.2.1-src_main.patch
	"${FILESDIR}/${PN}"-0.2.1-src_ui_mainwindow.patch )

DOCS=( CHANGELOG.txt README.md )

src_prepare() {
	default

	"$(qt5_get_bindir)"/lrelease src/qwinff.pro || die "lrelease failed"
}

src_configure() {
	USE_LIBNOTIFY="$(usex libnotify 1 0)" eqmake5 src/qwinff.pro
}

src_test() {
	pushd src/tests || die "pushd failed"
	virtx sh run-tests.sh || die "run-tests failed"
	popd || die "popd failed"
}

src_install() {
	einstalldocs

	dobin qwinff
	insinto /usr/share/qwinff
	doins src/{constants,presets}.xml
	insinto /usr/share/qwinff/translations
	doins src/translations/*.qm
	doman man/qwinff.1
	domenu qwinff.desktop
	newicon -s 256 src/icons/qwinff_256x256.png qwinff.png
}

pkg_postinst() {
	optfeature "adjusting audio speed" media-sound/sox
	optfeature "previewing audio/video cutting" media-video/mplayer
}
