.PHONY: set_dotfiles
set_dotfiles:
	stow --dotfiles -d dotfiles -t "$(HOME)" .
