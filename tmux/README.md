# TMUX - Terminal MUltipleXer

TMUX is handy tool for managing multiple terminal sessions. You can create 
multiple windows and tabs, leave sessions running in the backgroun and picking
them back up whenever needed. You can go [here](https://github.com/tmux/tmux/wiki)
to check the tool in its entirety.

As other tools, TMUX offers multiple customization options and plugins that will 
be shown here. 

## Installation

The script provided will create a link for the configuration file contained in 
this repo in your home folder. TMUX will automatically source that file on startup.
Once inside a tmux session, press CTRL + I to install plugins. These plugins will be
placed in a plugins directory in $HOME/.tmux folder. Newer versions of TMUX will 
automatically source file and place plugin files in $HOME/.config/tmux, but that 
is not the case for my current installation. I'll update the script once I get 
a new version of tmux on my machine.

## Config 
This configuration started from [this](https://youtu.be/DzNmUNvnB04) video.
The configuration file contains the following options:
- Terminal colors 
- Mouse support 
- Counting panes starts from 1 
- CTRL Space as leader key
- Keybindings to switch between windows 
- Vi Key set enabled 
- Yank mode keymap to select and copy lines in stdout 
- Windows born from a split will open in the same working directory 

## Plugins 
All plugins are installed using [TPM](https://github.com/tmux-plugins/tpm)
- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
    Adds a couple of keymappings and options that > every tmux user should agree on 

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
    Allows for seamless navigations between vim and tmux windows 

- [catpuccin-tmux](https://github.com/catppuccin/tmux)
    Theme for tmux 

- [tmux-yank](https://github.com/tmux-plugins/tmux-yank)
    Allows yank commands to copy text to the system clipboard


