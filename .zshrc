# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

export RANGER_LOAD_DEFAULT_RC=false
export EDITOR="/usr/bin/nvim"                           # making it point to this path makes it so that i can use my config when using nvim as root usr
export DATA="/media/data"

#-----------------------------------------------------
#		        plugins
#-----------------------------------------------------

# some good plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# -----------------------------------------------------
# 			aliases
# -----------------------------------------------------

# git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# constant use commands
alias ls="lsd -AF"
alias l="lsd -AF1"
alias ll="lsd -AlF --total-size"
alias lt="lsd --tree"

alias ..="cd ../"
alias ...="cd ../../"

alias shutn="sudo shutdown now"

# neovim because im extra lzy lmao
alias v="nvim"
#-----------------------------------------------------
#		       keybings
#----------------------------------------------------


# set vim style keybinds
# bindkey -v

# zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept

# some keybinds for ease of use (very slightly inspired by vim keybinds)
bindkey '^[ ' backward-kill-word
bindkey '^[l' clear-screen() { clear }
bindkey '^[k' up-line-or-history 

eval "$(starship init zsh)"

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<

[ -f "/home/beever/.ghcup/env" ] && source "/home/beever/.ghcup/env" # ghcup-env

neofetch
