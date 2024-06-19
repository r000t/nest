# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 optfeature

DESCRIPTION="unittest-based test runner with Ant/JUnit like XML reporting"
HOMEPAGE="https://github.com/xmlrunner/unittest-xml-reporting"
SRC_URI="https://github.com/xmlrunner/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/lxml[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/django[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest

pkg_postinst() {
	optfeature "integration with django" dev-python/django
}
