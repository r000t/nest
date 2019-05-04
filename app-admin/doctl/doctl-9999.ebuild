# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/digitalocean/${PN}"

inherit golang-build golang-vcs

DESCRIPTION="A command line tool for DigitalOcean services"
HOMEPAGE="https://github.com/digitalocean/doctl"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DOCS=( src/"${EGO_PN}"/CHANGELOG.md )

src_compile() {
	# Package requires specific path to target
	EGO_PN="${EGO_PN}/cmd/doctl"
	golang-build_src_compile
	EGO_PN="github.com/digitalocean/${PN}"
}

src_install() {
	einstalldocs
	dobin doctl
}