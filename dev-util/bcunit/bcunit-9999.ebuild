# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://gitlab.linphone.org/BC/public/${PN}.git"

inherit cmake git-r3

DESCRIPTION="BC Unit Test Framework"
HOMEPAGE="https://gitlab.linphone.org/BC/public/bcunit"

LICENSE="GPL-2"
SLOT="0"
IUSE="debug doc examples ncurses test"
RESTRICT="test" # fails: BCUnit_intl.h: No such file or directory

RDEPEND="ncurses? ( sys-libs/ncurses:0= )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		-DENABLE_BCUNIT_CURSES="$(usex ncurses)"
		-DENABLE_BCUNIT_DOC="$(usex doc)"
		-DENABLE_BCUNIT_EXAMPLES="$(usex examples)"
		-DENABLE_BCUNIT_MEMTRACE="$(usex debug)"
		-DENABLE_BCUNIT_TEST="$(usex test)"
	)

	cmake_src_configure
}
