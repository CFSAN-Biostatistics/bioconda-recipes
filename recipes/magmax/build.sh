#!/bin/bash
set -euo pipefail

# Add workaround for SSH-based Git connections from Rust/cargo.  See https://github.com/rust-lang/cargo/issues/2078 for details.
# We set CARGO_HOME because we don't pass on HOME to conda-build, thus rendering the default "${HOME}/.cargo" defunct.
export CARGO_NET_GIT_FETCH_WITH_CLI=true
export CARGO_HOME="$(pwd)/.cargo"

# build statically linked binary with Rust
RUST_BACKTRACE=1 cargo install --verbose --path . --root $PREFIX
