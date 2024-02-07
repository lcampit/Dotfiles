<h1 align="center">DOTFILES</h1>
<p align="center">
    <em>Dotfiles collection used to configure my own development environment</em>
</p>
<p align="center">
  <a href="https://dl.circleci.com/status-badge/redirect/gh/Leo-Campo/Dotfiles/tree/main">
    <img src="https://dl.circleci.com/status-badge/img/gh/Leo-Campo/Dotfiles/tree/main.svg?style=shield" alt="CI results">
  </a>
    <img src="https://img.shields.io/github/commit-activity/t/Leo-Campo/Dotfiles?style=flat" alt="github commits">
</p>

---

## 🔗 Quick Links

> - [🚀 Installation](#-installation)
> - [🧩 Fonts](#-fonts)
> - [🌆 Screenshots](#-screenshots)
> - [🛠 Notes](#-notes)
> - [🤝 Contributing](#-contributing)

---

## 🚀 Installation

**Warning:** Feel free to give these dotfiles a try. However, I advise you to
fork this repository first and look around. Get a feel of what it will set up
for you and remove things you don’t want or need. Don’t blindly use my settings
unless you know what that entails. Use at your own risk!

The repo used to provide a central installation script to install
single configurations or all of them at once. This script was written using the
[bashly](https://bashly.dannyb.co/) framework, an amazing tool that allows for
robust and standardized bash scripts. For reference, I kept this paragraph
here.

As the project evolved, I switched to a dotfile management framework:
[Dotbot](https://github.com/anishathalye/dotbot).

Dotbot is an handy framework with no dependencies that installs as a
submodule on this repo and provides a central installation script, configured
using one or more `yaml` files. I suggest giving it a read and include it
in your own dotfile repo if it tickles your fancies. It also supports plugins
for multiple use cases.

With dotbot, installation is as simple as:

```bash
git clone https://github.com/Leo-Campo/Dotfiles && cd Dotfiles
./install
```

This will perform all steps defined in the dotbot configuration file.
These steps will automatically link dotfiles in their respective location,
_overwriting existing ones_ (beware).

With dotbot, it is possible to create multiple configuration files. The repo
contains a `full-install.conf.yaml` file that links all configuration files and
but also perform installations steps for
all tools needed. It is intended to be a one line full install for new machines
or images. All dependencies and tools will be installed and it may take
a while. To perform this kind of installation run:

```bash
./install -c full-install.conf.yaml
```

These installation steps are meant to be _idempotent_, therefore should
perform no operation if dependencies or tools are already installed.

## 🧩 Fonts

My terminal uses the [Jetbrains Mono](https://www.jetbrains.com/lp/mono/) font,
made for developers with a bunch of useful features and symbols.

## Included tools and references

This repo takes inspiration from [this](https://github.com/benmatselby/dotfiles)
fellow developer dotfiles repo. I know there are probably thousands of similar
repos, but that is the one that I stumbled across first.

The repo contains a dedicated folder and README file for any tool that I use on my machines.

## 🛠 Notes

There are some tools in this list written in Rust.
I stumbled across [this video](https://youtu.be/dFkGNe4oaKk)
that showed me those nice tools.
They do compile practically everywhere and are some of
the fastest options in the market,
therefore I decided to give them a try. As more and more rust video will surely
flood my home (thanks youtube algorithm), I'm sure that list will be updated.

## 🌆 Screenshots

![Overview of my setup](/../screenshots/images/OverviewSetup.png?raw=true "Setup Overview")
Overview of an alacritty window running tmux with 3 panes: nvim, lazygit and a
shell running starship prompt

![Nvim Overview](/../screenshots/images/NvimOverview.png?raw=true "Nvim overview")
Overview of my neovim configuration featuring nerdtree, webdevicons, tokyonight storm
theme, lsps and much more

## 🤝 Contributing

Feel free to contribute in any way shape or form you may think of: open issues
for bugs you may encounter using my configuration, suggests new tools or different settings
and more!
