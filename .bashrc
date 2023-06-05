#!bash
# shellcheck disable=SC1090

case $- in
*i*) ;; # interactive
*) return ;;
esac

# ---------------------- local utility functions ---------------------

_have()      { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
#                           (also see envx)

export USER="${USER:-$(whoami)}"
export TERM=kitty
export EDITOR=nvim
export VISUAL="$EDITOR"
export EDITOR_PREFIX=vim
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# ------------------------------- path -------------------------------

export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/.emacs.d/bin/:$HOME/programs/neovim-bin/bin:$PATH"

# ------------------------ bash shell options ------------------------

# shopt is for BASHOPTS, set is for SHELLOPTS

shopt -s checkwinsize  # enables $COLUMNS and $ROWS
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

#shopt -s nullglob # bug kills completion for some
#set -o noclobber

# -------------------------- stty annoyances -------------------------

stty stop undef # disable control-s accidental terminal stops

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

# shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

__ps1() {
  local P='$' dir="${PWD##*/}" B prompt\
    r='\[\e[31m\]' gr='\[\e[32m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B == master || $B == main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

  short="$u\u$g@$h\h$g:$w$dir$B$p$P$x "
  long="$g╔ $u\u$g@$h\h$g:$w$dir$B\n$g╚ $p$P$x "
  double="$g╔ $u\u$g@$H\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$g$x "
  prompt="$g╔ $w$PWD $h$B\n$g╚$gr 00¬$x "
  PS1="$prompt"
}

PROMPT_COMMAND="__ps1"

unalias -a
alias ip='ip -c'
alias '?'=duck

alias ls='ls -h --color=auto'

alias free='free -h'
alias tree='tree -a'
alias df='df -h'
alias chmox='chmod +x'
alias diff='diff --color'
alias view='vim -R'
alias vi="vim"
alias nv="$HOME/programs/neovim-bin/bin/nvim"
# alias clear='printf "\e[H\e[2J"'
# alias c='printf "\e[H\e[2J"'
alias more="less"
alias shutn="shutdown now"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias pacman='pacman --color auto'
alias pss='pacman -Ss'
alias pqq='pacman -Qq'
alias prns='pacman -Rns'

eval "$(starship init bash)"
neofetch
