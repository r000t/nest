# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
EGIT_REPO_URI="https://github.com/openai/openai-python.git"
PYTHON_COMPAT=( python3_{9..12} )

inherit distutils-r1 git-r3

DESCRIPTION="The official Python library for the OpenAI API"
HOMEPAGE="https://github.com/openai/openai-python"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/anyio[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="test? ( dev-python/dirty-equals[${PYTHON_USEDEP}]
		dev-python/respx[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# need mock server
	tests/test_client.py::TestAsyncOpenAI::test_retrying_timeout_errors_doesnt_leak
	tests/test_client.py::TestAsyncOpenAI::test_retrying_status_errors_doesnt_leak
	tests/test_client.py::TestOpenAI::test_retrying_timeout_errors_doesnt_leak
	tests/test_client.py::TestOpenAI::test_retrying_status_errors_doesnt_leak
)

src_prepare() {
	default

	# remove tests need mock server
	rm -rf tests/api_resources || die "rm failed"
}
