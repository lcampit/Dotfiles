# Rust Userland
I stumbled across [this video](https://youtu.be/dFkGNe4oaKk) that showed some nice tools built in Rust.
They do compile practically everywhere and are some of the fastest options in the market,
therefore I decided to give them a try. As more and more rust video will surely 
flood my home (thanks youtube algorithm), I'm sure this list will be updated.

## Installation
The install script here provided will check for rust on your system, install it 
if not present and then install all tools listed here. Aliases and other configurations
may be separated from this, be sure to check the rest of the repo or build your own.

### [sccache](https://github.com/mozilla/sccache)
- Allows for faster cargo compilation time by using cached packages, even in cloud.
- Make sure to have it in your PATH and set up RUSTC_WRAPPER envinronment variable
to use it when compiling, or set the relevant option in your .cargo/config.toml file

### [exa](https://github.com/ogham/exa)
- A replacement for the venerable file listing command ls 

### [bat](https://github.com/sharkdp/bat)
- A cat clone with wings 

### [zellij](https://github.com/zellij-org/zellij)
- A workspace manager for developers on the terminal

### [ripgrep](https://github.com/behnam/rust-ripgrep)
- A new, faster alternative to grep

### [starship](https://starship.rs/)
- A blazing fast customizable prompt

### [bob-nvim](https://github.com/MordechaiHadad/bob)
- A Nvim version manager tool 

### [mprocs](https://github.com/pvolok/mprocs)
- A tool to keep long running processes under control in a unified window

### [gitui](https://github.com/extrawurst/gitui)
- A blazing fast terminal based git ui 
- This folder contains configurations for gitui that will be placed in `$HOME/.config/gitui/`

### [ncspot](https://github.com/hrkfdn/ncspot)
- A terminal based Spotify client
    - Some libs may be needed for this to work. If installation fails, install 
    missing dependencies using your package manager. In my case, I needed to run 
    `apt-get install libxcb-xfixes0-dev libxcb-shape0-dev`
- This folder contains configurations for ncspot that will be placed in `$HOME/.config/ncspot/`
    - Themes can be browsed [here](https://github.com/hrkfdn/ncspot/pull/40)

### [porsmo](https://github.com/ColorCookie-dev/porsmo)
- A terminal based pomodoro timer
    - I did stumble across an error with the alsa library when installing this 
    the first time. If you encounter the same issue, install this library using 
    your package manager. For Linux: `apt-get install librust-alsa-sys-dev`

### [rtx](https://github.com/jdxcode/rtx)
- A polyglot runtime manager 

### [wikitui](https://builditluc.github.io/wiki-tui/0.7/)
- A simple and easy to use Wikipedia Text User Interface
