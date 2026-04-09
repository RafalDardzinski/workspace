.DEFAULT_GOAL := workspace_arch_base

.PHONY: _apply_dotfiles
_apply_dotfiles: _prepare_homedir
	stow --dotfiles -d dotfiles -t "$(HOME)" tmux

.PHONY: _prepare_homedir
_prepare_homedir:
	set -a && \
		. dotfiles/zsh/dot-zshenv && \
		set +a && \
		mkdir -p $$XDG_CACHE_HOME && \
		mkdir -p $$XDG_CONFIG_HOME && \
		mkdir -p $$XDG_DATA_HOME && \
		mkdir -p $$XDG_STATE_HOME

.PHONY: _install_packages_arch
_install_packages_arch:
	sudo ./packages/pacman.core.sh

.PHONY: _install_ohmyzsh
_install_ohmyzsh: 
	stow --dotfiles -d dotfiles -t "$(HOME)" zsh
	./packages/oh-my-zsh.sh

.PHONY: _install_nvchad
_install_nvchad: 
	./packages/nvchad.sh
	stow --dotfiles -d dotfiles -t "$(HOME)" nvim 

.PHONY: workspace_arch_base
workspace_arch_base: _prepare_homedir _install_packages_arch _install_ohmyzsh _install_nvchad _apply_dotfiles
	sudo chsh -s /usr/bin/zsh
	echo "Finished setting up workspace: Arch Linux Base"

