# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Swagger UI for Django REST Framework"
HOMEPAGE="https://marcgibbons.com/django-rest-swagger/"
SRC_URI="https://github.com/marcgibbons/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/coreapi[${PYTHON_USEDEP}]
	dev-python/djangorestframework[${PYTHON_USEDEP}]
	dev-python/python-openapi-codec[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# unhashable type: 'list'
	tests/renderers/test_swagger.py::TestSwaggerUIRenderer::test_get_auth_urls
	# _asdict() must return a dict, not MagicMock
	tests/renderers/test_swagger.py::TestSwaggerUIRenderer::test_openapi_spec_is_added_to_context
	tests/renderers/test_swagger.py::TestSwaggerUIRenderer::test_set_context_sets_auth_urls
	tests/renderers/test_swagger.py::TestSwaggerUIRenderer::test_set_context_use_session_auth
)

python_test() {
	DJANGO_SETTINGS_MODULE=tests.settings PYTHONPATH=. epytest \
		|| die "tests failed with ${EPYTHON}"
}
