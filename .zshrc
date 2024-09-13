HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt append_history
setopt inc_append_history

# -------------------
#       Aliases
# -------------------

# make some things nicer
alias ip='ip -c'
alias free='free -h'
alias diff='diff --color'
alias df='df -h'

alias ls='ls -h --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -A1l'

alias ..="cd ../"
alias ...="cd ../../"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias shutn="shutdown now"
alias pss="pacman -Ss"
alias pqq='pacman -Qq'

alias zbr='zig build run'


# -------------------
#      Functions
# -------------------

function clone {
    [[ $1 != "" ]] && git clone git@github.com:$1
}

# ------------------
#       Prompt
# ------------------

# git info (built into zsh)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

BLACK=$'%{\e[0;0m\e[38;5;237m%}'
GREEN=$'%{\e[0;32m%}'
YELLOW=$'%{\e[0;33m%}'
BLUE=$'%{\e[0;34m%}'
# for some reason i cant have [ straight after a colour so here it is in
# a variable and now it works
BRACKET='['

PROMPT='$BLACK$BRACKET$YELLOW%B%n$BLACK] $GREEN%(4~|%-1~/.../%3~|%4~) $BLACK$vcs_info_msg_0_$BLUE%(1j.*.)$BLACK(.,.%) '

# ------------------
#      Env Vars
# ------------------

export LD_LIBRARY_PATH="/usr/local/lib/"
export EDITOR='nvim'
export PATH="$HOME/scripts:$HOME/.local/bin:$HOME/programs/neovim-bin/bin:$PATH"
export MANPAGER='nvim --cmd ":lua vim.g.noplugins=1" +Man!'

# -------------------
#   Initialisations
# -------------------

if [[ -d ~/.zsh/plugins/fast-syntax-highlighting ]] then
    source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

# completion with colours
autoload -Uz compinit
compinit

# fzf integration
source <(fzf --zsh)
