# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5..6}} )
EGIT_REPO_URI="https://gitlab.com/vstconsulting/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Wrapper for Ansible CLI"
HOMEPAGE="https://gitlab.com/vstconsulting/polemarch-ansible"
SRC_URI=""

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="app-admin/ansible[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_prepare_all() {
	# Remove unneeded requirement
	sed -i '/vstcompile/d' setup.py \
		|| die "sed failed for setup.py"

	distutils-r1_python_prepare_all
}

python_test() {
	"${PYTHON}" -m unittest discover -v || die "tests failed with ${EPYTHON}"
}