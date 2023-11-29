curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

cargo install sccache --locked
export RUSTC_WRAPPER="$CARGO_HOME/bin/sccache"
