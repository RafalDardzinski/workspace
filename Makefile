.PHONY: apply_dotfiles
apply_dotfiles: | prepare_homedir
	stow --dotfiles -d dotfiles -t "$(HOME)" tmux

prepare_homedir:
	set -a && \
		. dotfiles/zsh/dot-zshenv && \
		set +a && \
		mkdir -p $$XDG_CACHE_HOME && \
		mkdir -p $$XDG_CONFIG_HOME && \
		mkdir -p $$XDG_DATA_HOME && \
		mkdir -p $$XDG_STATE_HOME

.PHONY: install_packages_arch
install_packages_arch:
	sudo ./packages/pacman.core.sh

.PHONY: install_ohmyzsh
install_ohmyzsh: 
	stow --dotfiles -d dotfiles -t "$(HOME)" zsh
	./packages/oh-my-zsh.sh

.PHONY: install_nvchad
install_nvchad: 
	./packages/nvchad.sh
	stow --dotfiles -d dotfiles -t "$(HOME)" nvim

.PHONY: workspace_arch
workspace_arch: install_packages_arch install_ohmyzsh install_nvchad apply_dotfiles

