# [sccache](https://github.com/mozilla/sccache)

Allows for faster cargo compilation time by using cached packages, even in cloud.

Make sure to have it in your PATH and set up RUSTC_WRAPPER envinronment variable
to use it when compiling, or set the relevant option
in your .cargo/config.toml file
