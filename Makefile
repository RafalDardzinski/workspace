.PHONY: sync_linux sync_macos setup_linux_arch

DOTFILES := dotfiles

setup_linux_arch:
	sudo bash setup/01_pacman.sh
	bash setup/02_nvchad.sh
	bash setup/03_ohmyzsh.sh

sync_linux:
	rm "$(HOME)/.config/nvim/lua/mappings.lua" || true
	stow -d $(DOTFILES) -t $(HOME) linux 

sync_macos:
	stow -d $(DOTFILES) -t $(HOME) macos 

