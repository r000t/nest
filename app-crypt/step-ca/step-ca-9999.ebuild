# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://github.com/smallstep/certificates.git"

inherit fcaps git-r3 go-module systemd

DESCRIPTION="A private certificate authority and ACME server"
HOMEPAGE="https://github.com/smallstep/certificates"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

RDEPEND="acct-group/step
	acct-user/step
	sys-apps/pcsc-lite"

S="${WORKDIR}/certificates-${PV}"

DOCS=( {CHANGELOG,README}.md )

FILECAPS=( cap_net_bind_service+ep usr/bin/step-ca )

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	DATE="$(date -u '+%Y-%m-%d-%H%M UTC')"
	LDFLAGS="-w -X main.Version=${PV} -X \"main.BuildTime=${DATE}\""

	ego build -buildmode=pie \
		-ldflags "${LDFLAGS}" -trimpath ./cmd/...
}

src_test() {
	ego test -work ./...
}

src_install() {
	einstalldocs
	dobin step-ca
	newinitd "${FILESDIR}"/step-ca.initd step-ca
	newconfd "${FILESDIR}"/step-ca.confd step-ca
	systemd_dounit systemd/step-ca.service
	newtmpfiles "${FILESDIR}"/step-ca.tmpfile step-ca.conf
}

pkg_postinst() {
	tmpfiles_process step-ca.conf
	fcaps_pkg_postinst
}
