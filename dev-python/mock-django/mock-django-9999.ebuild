# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
EGIT_REPO_URI="https://github.com/dcramer/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="A simple library for mocking certain Django behavior"
HOMEPAGE="https://github.com/dcramer/mock-django"

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]"
