# GitConfig

My personal git configuration. This file sets up hook directories, pager, aliases and
much more used within git. It will automatically source, if present, a `.gitconfig_extra`
file to fine tune settings specific for each machine.

As pager I currently use [Delta](https://github.com/dandavison/delta), a
syntax-highlighting pager for git, diff, and grep output

The configuration includes a `ignore` file
that git will automatically use to ignore
certain configuration files in my repos, such as
`lazyrc` for lazyvim settings.
