SHELL := /bin/sh
.DEFAULT_GOAL := workspace_arch_base

.PHONY: _apply_dotfiles
_apply_dotfiles: _prepare_homedir
	stow --dotfiles -d dotfiles -t "$(HOME)" tmux

.PHONY: _prepare_homedir
_prepare_homedir:
	set -a && \
		. dotfiles/zsh/dot-zshenv && \
		set +a && \
		mkdir -p $$XDG_CACHE_HOME \
						 $$XDG_DATA_HOME && \
						 $$XDG_STATE_HOME && \
						"$${XDG_CONFIG_HOME}/zsh"


.PHONY: _install_packages_arch
_install_packages_arch:
	sudo ./shell/pacman.core.sh

.PHONY: _install_ohmyzsh: _prepare_homedir
_install_ohmyzsh:
	stow --dotfiles -d dotfiles -t "$(HOME)" zsh
	./shell/oh-my-zsh.sh

.PHONY: _install_nodejs
_install_nodejs: _install_nodejs _prepare_homedir
	./shell/node-lts.sh

.PHONY: _install_nvchad
_install_nvchad: _install_nodejs
	./shell/nvchad.sh
	stow --dotfiles -d dotfiles -t "$(HOME)" nvim 

.PHONY: workspace_arch_base
workspace_arch_base: _prepare_homedir _install_packages_arch _install_ohmyzsh _install_nvchad _apply_dotfiles
	chsh -s /usr/bin/zsh
	$(info "Finished setting up workspace: Arch Linux Base")

