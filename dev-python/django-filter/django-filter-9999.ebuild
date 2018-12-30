# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{4..6} )
EGIT_REPO_URI="https://github.com/carltongibson/${PN}.git"

inherit distutils-r1 eutils git-r3

DESCRIPTION="Django application for filtering querysets"
HOMEPAGE="https://github.com/carltongibson/django-filter"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( $(python_gen_impl_dep sqlite)
		dev-python/django-crispy-forms[${PYTHON_USEDEP}]
		dev-python/django-rest-framework[${PYTHON_USEDEP}]
		dev-python/python-coreapi[${PYTHON_USEDEP}]
		virtual/python-unittest-mock[${PYTHON_USEDEP}] )"

python_test() {
	./runtests.py --verbosity 2 || die "tests failed with ${EPYTHON}"
}

pkg_postinst() {
	optfeature "enhancing the presentation of the filter forms in HTML views" dev-python/django-crispy-forms
	optfeature "custom FilterSet and filter backend for Django REST Framework" dev-python/django-rest-framework
	optfeature "integration with Core API" dev-python/python-coreapi
	optfeature "integration with Django REST Framework schema generation" dev-python/python-coreschema
}