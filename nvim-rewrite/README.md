# NVIM from scratch

This is my own attempt at rewriting my NVIM
configuration from start to finish. After trying out
different distributions, I came up with the conclusion
that rewriting my configuration will let me learn
and set all keymaps that right now are taking dust
in my lazyvim setup.

I'm not sure whether this will actually replace my current
setup, as lazyvim is being actively developed on and it is
implementing features that I may need (looking at you
`.lazyrc` files that tweak nvim config on a per-project basis).
If that will be the case, I'll keep using lazyvim distribution
for those feature while loading my own plugins and configuration.

## Features

First of all, I need to define what features I want in my personal
editor. I'll use this section as a scratchpad to keep track of
what I want and what I've configured so far.

My unordered santa's list contains:

- Relative numbers
- Colorscheme (Tokyonight storm)
- Highlighting for my most used languages
- Lsps for my most used languages
- Database connection and auto-completion
- Autocompletion (with or without snippets)
- FileTree
- Grepping in file and in project
- Git features
- Debug UI and adapters for my most used languages
- Testing support for my most used languages
- Keymap to grep for word under cursors (thanks @ThePrimagean)
- Formatters and format on save following project specific configurations
- Which key to help using keymaps
- Symbol renaming
- File wide search and replace
- Symbol navigation (aerial comes to mind)
- Noice UI
- Trouble diagnostics
- Todo/fixme/etc management
- Conceal
- Window/Buffer management

Languages and other to get support for are: Python, C, Rust, Go,
Typescript, HTML, CSS/Tailwind, Docker, Yaml, Sql, Json, Java.

This file will grow over time to contain all keymaps, plugins and
feature I pack my own personal NVIM with.
