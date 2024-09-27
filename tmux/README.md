# [Tmux](https://github.com/tmux/tmux)

TMUX is handy tool for managing multiple terminal sessions. You can create
multiple windows and tabs, leave sessions running in the background and picking
them back up whenever needed. You can go [here](https://github.com/tmux/tmux/wiki)
to check the tool in its entirety.

As other tools, TMUX offers multiple customization options and plugins that will
be shown here.

## Tmux Installation

The script provided will link my configuration files in `~/.config/tmux/`.
TMUX will automatically source that file on startup. At any moment, press
`prefix + r` to source the configuration file manually.

Once inside a tmux session, press **prefix + CTRL + I** (for my current configuration
, CTRL + space is set as prefix) to install plugins.
These plugins will be placed in a plugins directory in `$HOME/.config/tmux` folder.

## Config

This configuration started from [this](https://youtu.be/DzNmUNvnB04) video and
it received a major overhaul after watching
[this](https://www.youtube.com/watch?v=GH3kpsbbERo&pp=ugMICgJpdBABGAHKBQ5kZXZvcHMgdG9vbGJvYw%3D%3)
video.
The configuration file contains the following options:

- Terminal colors
- Mouse support
- Counting panes starts from 1
- CTRL Space as leader key
- Keybindings to switch between windows
- Vi Key set enabled
- Yank mode keymap to select and copy lines in stdout
- Windows born from a split will open in the same working directory

I've then added plugins and configurations to fit my workflow.

## Plugins

All plugins are installed using [TPM](https://github.com/tmux-plugins/tpm)

- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)  
  Adds a couple of key mappings and options that every tmux user should agree on

- [catppuccin](https://github.com/catppuccin/tmux)  
  Theme for tmux

- [tmux-yank](https://github.com/tmux-plugins/tmux-yank)  
  Allows yank commands to copy text to the system clipboard

- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)  
  Allows for tmux sessions to be recovered after system reboots

- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)  
  Periodically saves tmux sessions and state to be restored with resurrect

- [tmux-tilish](https://github.com/jabirali/tmux-tilish)  
  Sets sensible key mappings to have tmux behave more like a window manager

- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
  Shows on the status bar whether the tmux
  prefix key has been pressed

- [tmux-fzf](https://github.com/sainnhe/tmux-fzf)
  Uses fzf to manage tmux windows, panes and much more
  Currently bound to `<prefix> + F`

- [tmux-fzf-url](https://github.com/wfxr/tmux-fzf-url)
  Uses fzf to show recently shown urls and automatically
  open them in the browser

- [tmux-sessionx](https://github.com/omerxx/tmux-sessionx)
  A fancy tmux session manager

## Scripts and Session management

My tmux configuration got a major upgrade when stumbling across [this](https://www.reddit.com/r/neovim/comments/17cb1ah/what_is_the_benefit_of_tmux_why_should_i_use_it/) post
and consequently [this](https://waylonwalker.com/tmux-nav-2021/) guide.
I've added a couple of key mappings in my configuration to switch between active sessions.

The **ta** script provided in the bin folder is a modified version
of the one discussed in
the guide. It allows to create sessions in the current directory or any
subdirectory, automatically taking care of naming and other stuff.
Such script, contained in the repo `bin` folder, will be linked and
added to your `PATH` during installation.

The `tkill` alias allows to kill tmux sessions with ease.

These scripts are still included, but I'm moving
to use a more modern tmux manager instead.
