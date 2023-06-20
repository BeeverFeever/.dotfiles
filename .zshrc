HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

export LD_LIBRARY_PATH="/usr/local/lib/"
export EDITOR="/usr/bin/nvim"                           # making it point to this path makes it so that i can use my config when using nvim as root usr
export DATA="/media/data"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/programs/neovim-bin/bin:$PATH"

DISABLE_AUTO_TITLE="true"




parse_git_dirty() {
  git_status="$(git status 2> /dev/null)"
  [[ "$git_status" =~ "Changes to be committed:" ]] && echo -n "%F{green}·%f"
  [[ "$git_status" =~ "Changes not staged for commit:" ]] && echo -n "%F{yellow}·%f"
  [[ "$git_status" =~ "Untracked files:" ]] && echo -n "%F{red}·%f"
}

setopt prompt_subst

NEWLINE=$'\n'

autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:git*' formats ' ↣ (%F{254}%b%F{245})' # format $vcs_info_msg_0_

PS1='%F{254}%n%F{245} ↣ %F{153}%(5~|%-1~/⋯/%3~|%4~)%F{245}${vcs_info_msg_0_} $(parse_git_dirty)$NEWLINE%F{254}$%f '





# make some things nicer
alias ip='ip -c'
alias free='free -h'
alias diff='diff --color'
alias df='df -h'
alias fzf='fzf --preview "less --use-color"'

# all inherit the parameters from base ls
alias ls='ls -hF --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -A -1'
# if you want more info just add -l to any of these aliases

alias ..="cd ../"
alias ...="cd ../../"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias data="cd /media/data/"
alias shutn="shutdown now"
alias vi="nvim"
alias pacman='pacman --color auto'
alias pss="pacman -Ss"
alias pqq='pacman -Qq'

bindkey '^H' backward-kill-word

# eval "$(starship init zsh)"
pfetch
