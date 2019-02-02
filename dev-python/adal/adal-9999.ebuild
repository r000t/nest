# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{4..6}} )
PYTHON_REQ_USE="threads(+)"

MY_PN="azure-activedirectory-library-for-python"
MY_P="${MY_PN}-${PV}"

EGIT_REPO_URI="https://github.com/AzureAD/${MY_PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Library for authentication in Azure Active Directory"
HOMEPAGE="https://github.com/AzureAD/azure-activedirectory-library-for-python"
SRC_URI=""

SLOT="0"
LICENSE="MIT"
KEYWORDS=""
IUSE="test"
# external connections fail
RESTRICT="test"

RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pyjwt[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/httpretty[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		virtual/python-unittest-mock[${PYTHON_USEDEP}] )"

python_test() {
	"${PYTHON}" -m unittest discover -v || die "tests failed with ${EPYTHON}"
}
