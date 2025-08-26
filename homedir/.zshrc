# -- Oh My Zsh -- 
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Starship handles the prompt.
ZSH_DISABLE_COMPFIX="true" # Only because it's my local PC.

plugins=(git aws ansible dotnet fzf podman terraform colored-man-pages)
source $ZSH/oh-my-zsh.sh

# -- History config --
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
HIST_STAMPS="yyyy-mm-dd"
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_REDUCE_BLANKS

# -- Prompt --
eval "$(starship init zsh)"

# -- External plugins --
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6a6a6a'
fi

[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -- fzf --
# Use faster backends if available. Otherwise fzf falls back to find.
command -v rg >/dev/null && export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!.git"'
command -v fd >/dev/null && export FZF_DEFAULT_COMMAND='fd -H -t f -L -E .git'

# -- Misc --
export EDITOR="nvim"
export PAGER="less"
export LESS='-R'

# -- Aliases --
alias vim=nvim
