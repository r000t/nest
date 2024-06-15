# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# shellcheck disable=SC2086

EAPI=8

CRATES="ahash@0.8.8
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.11
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.79
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.2
	bumpalo@3.15.0
	cassowary@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.34
	clap@4.5.1
	clap_builder@4.5.1
	clap_derive@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	const_fn@0.4.9
	const_format@0.2.32
	const_format_proc_macros@0.2.32
	core-foundation-sys@0.8.6
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	deranged@0.3.11
	dns-lookup@2.0.4
	either@1.10.0
	form_urlencoded@1.2.1
	getrandom@0.2.12
	git2@0.18.2
	hashbrown@0.14.3
	heck@0.4.1
	iana-time-zone@0.1.60
	iana-time-zone-haiku@0.1.2
	idna@0.5.0
	indoc@2.0.4
	is_debug@1.0.1
	itertools@0.11.0
	itertools@0.12.1
	itoa@1.0.10
	jobserver@0.1.28
	js-sys@0.3.68
	lazy-regex@3.1.0
	lazy-regex-proc_macros@3.1.0
	lazy_static@1.4.0
	libc@0.2.153
	libgit2-sys@0.16.2+1.7.2
	libz-sys@1.1.15
	lock_api@0.4.11
	log@0.4.20
	lru@0.12.2
	memchr@2.7.1
	mio@0.8.10
	num-conv@0.1.0
	num-traits@0.2.18
	num_threads@0.1.7
	once_cell@1.19.0
	os_info@3.7.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	percent-encoding@2.3.1
	pinger@1.1.1
	pkg-config@0.3.30
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.78
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.24.0
	redox_syscall@0.4.1
	regex@1.10.3
	regex-automata@0.4.5
	regex-syntax@0.8.2
	rustversion@1.0.14
	scopeguard@1.2.0
	serde@1.0.196
	serde_derive@1.0.196
	shadow-rs@0.26.1
	signal-hook@0.3.17
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	smallvec@1.13.1
	socket2@0.5.5
	static_assertions@1.1.0
	strsim@0.11.0
	strum@0.25.0
	strum_macros@0.25.3
	syn@2.0.49
	thiserror@1.0.57
	thiserror-impl@1.0.57
	time@0.3.34
	time-core@0.1.2
	time-macros@0.2.17
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tz-rs@0.6.14
	tzdb@0.6.1
	tzdb_data@0.1.2
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.11.0
	unicode-width@0.1.11
	unicode-xid@0.2.4
	url@2.5.0
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.91
	wasm-bindgen-backend@0.2.91
	wasm-bindgen-macro@0.2.91
	wasm-bindgen-macro-support@0.2.91
	wasm-bindgen-shared@0.2.91
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi_forked_icmpapi@0.3.7
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winping@0.10.1
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	${PN}@${PV}"

inherit cargo

DESCRIPTION="Ping, but with a graph"
HOMEPAGE="https://github.com/orf/gping"
SRC_URI="${CARGO_CRATE_URIS}"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 MIT MIT-0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

QA_FLAGS_IGNORED="usr/bin/gping"

src_prepare() {
	default

	# remove git2 dependency
	sed -i '/shadow-rs/!b;n;cshadow-rs = { version = "0.26.1", default-features = false }' \
		Cargo.toml || die "sed failed for Cargo.toml"
}

src_install() {
	einstalldocs
	doman "${FILESDIR}"/gping.1
	cargo_src_install
}
