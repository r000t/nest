# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=8

CRATES="aho-corasick@1.1.3
	ansi_term@0.12.1
	anstream@0.6.13
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	assert_cmd@2.0.14
	bitflags@1.3.2
	bitflags@2.5.0
	bstr@1.9.1
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	clap@4.5.4
	clap_builder@4.5.2
	clap_complete@4.5.1
	clap_lex@0.7.0
	clap_mangen@0.2.20
	colorchoice@1.0.0
	config-file@0.2.3
	core-foundation-sys@0.8.6
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	ctrlc@3.4.4
	difflib@0.4.0
	directories@4.0.1
	dirs-sys@0.3.7
	doc-comment@0.3.3
	either@1.10.0
	errno@0.3.8
	fastrand@2.0.2
	filesize@0.2.0
	getrandom@0.2.12
	hermit-abi@0.3.9
	io-lifetimes@1.0.11
	libc@0.2.153
	libredox@0.0.1
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.13
	lscolors@0.13.0
	memchr@2.7.1
	nix@0.28.0
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	once_cell@1.19.0
	overload@0.1.1
	predicates@3.1.0
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro2@1.0.79
	quote@1.0.35
	rayon@1.10.0
	rayon-core@1.12.1
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.4
	regex-automata@0.4.6
	regex-syntax@0.8.2
	roff@0.2.1
	rustix@0.37.27
	rustix@0.38.32
	serde@1.0.197
	serde_derive@1.0.197
	stfu8@0.2.7
	strsim@0.11.0
	syn@2.0.55
	sysinfo@0.27.8
	tempfile@3.10.1
	terminal_size@0.2.6
	termtree@0.4.1
	thiserror@1.0.58
	thiserror-impl@1.0.58
	thousands@0.2.0
	toml@0.5.11
	unicode-ident@1.0.12
	unicode-width@0.1.11
	utf8parse@0.2.1
	wait-timeout@0.2.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4"

inherit cargo

DESCRIPTION="More intuitive version of du"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

QA_PREBUILT="usr/bin/dust"

src_install() {
	einstalldocs
	cargo_src_install
}
