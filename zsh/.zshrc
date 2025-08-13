# zmodload zsh/zprof

DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

export ZSH="$HOME/.oh-my-zsh"
export PATH=/snap/bin:$PATH
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME=""

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#C8C093,bg=#2A2A37,bold,underline"
unsetopt BEEP

source $ZSH/oh-my-zsh.sh

# fpath+=($HOME/.zsh/pure)
# autoload -U promptinit; promptinit
# prompt pure

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi
# export MANPATH="/usr/local/man:$MANPATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vi="nvim"
alias vim="nvim"
alias srczsh="source ~/.zshrc"
alias ls="ls --color"
alias lsa="eza -lah --icons"
alias bat="batcat --theme=base16"
alias todos='grep --color=auto -rnwI --exclude-dir={.idea,.assets,.vscode,.git,target} "TODO"'
eval "$(starship init zsh)"

export PATH=$PATH:~/scripts
export MANPAGER="nvim +Man!"
export LS_COLORS="$(vivid generate nord)"

# opam configuration
[[ ! -r /home/vasilis/.opam/opam-init/init.zsh ]] || source /home/vasilis/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# zprof
