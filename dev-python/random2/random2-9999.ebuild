# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5..7}} )
EGIT_REPO_URI="https://github.com/strichter/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Python-2.7 random module ported to python-3"
HOMEPAGE="https://github.com/strichter/random2"
SRC_URI=""

LICENSE="PSF-2"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="test"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" -m unittest discover -v src/ || die "tests failed with ${EPYTHON}"
}
