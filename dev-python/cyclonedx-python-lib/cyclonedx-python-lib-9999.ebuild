# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
EGIT_REPO_URI="https://github.com/CycloneDX/${PN}.git"
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Python library for generating CycloneDX SBOMs"
HOMEPAGE="https://github.com/CycloneDX/cyclonedx-python-lib"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
RESTRICT="test"
PROPERTIES="test_network"

RDEPEND="dev-python/importlib_metadata[${PYTHON_USEDEP}]
	dev-python/packageurl[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="test? ( app-text/xmldiff[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest

python_test() {
	"${PYTHON}" -m unittest discover -v tests || die "tests failed with ${EPYTHON}"
}
