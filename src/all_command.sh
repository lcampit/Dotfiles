install_all() {
	echo "Installing sccache first to use for later installations"
	install_sccache

	install_bob

	install_bat

	install_delta

	install_exa

	install_fd

	install_gitui

	install_lazygit

	install_mprocs

	install_navi

	install_nvim

	install_porsmo

	install_rtx

	install_starship

	install_tmux

	install_wezterm

	install_wikitui

	install_zellij

	install_zoxide

	install_zsh

	install_fzf
}

install_all
