SHELL := /bin/sh
.DEFAULT_GOAL := workspace_arch_base

define stow_cfg
	stow --dotfiles -d dotfiles -t "$(HOME)" $(1)
endef

.PHONY: _apply_dotfiles
_apply_dotfiles: _prepare_homedir
	$(call stow_cfg,tmux)

.PHONY: _prepare_homedir
_prepare_homedir:
	set -a && \
		. dotfiles/zsh/dot-zshenv && \
		set +a && \
		mkdir -p \
			"$$XDG_CACHE_HOME" \
			"$$XDG_DATA_HOME" \
			"$$XDG_STATE_HOME" \
			"$${XDG_CONFIG_HOME}/zsh"

.PHONY: _install_packages_arch
_install_packages_arch:
	sudo ./shell/pacman.core.sh

.PHONY: _install_ohmyzsh
_install_ohmyzsh: _prepare_homedir
	$(call stow_cfg,zsh)
	./shell/oh-my-zsh.sh

.PHONY: _install_nodejs
_install_nodejs:
	./shell/node-lts.sh

.PHONY: _install_nvchad
_install_nvchad: _install_nodejs _prepare_homedir
	$(call stow_cfg,nvim)
	@printf '%s\n' 'NvChad installed. Run it and do :TSInstallAll and :MasonInstallAll'

.PHONY: config_backup
config_backup:
	./shell/configs-backup.sh zsh tmux nvim

.PHONY: config_apply
config_apply:
	$(call stow_cfg,zsh)
	$(call stow_cfg,tmux)
	$(call stow_cfg,nvim)

.PHONY: workspace_arch_base
workspace_arch_base: _prepare_homedir _install_packages_arch _install_ohmyzsh _install_nvchad _apply_dotfiles
	chsh -s /usr/bin/zsh
	@printf '%s\n' 'Finished setting up workspace: Arch Linux Base'

.PHONY: workspace_macos_base
workspace_macos_base: _prepare_homedir _install_ohmyzsh _install_nvchad _apply_dotfiles
	@printf '%s\n' 'Finished setting up workspace: macOS Base'
