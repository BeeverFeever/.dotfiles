#!/usr/bin/env bash

package=$(pacman -Qq | fzf --multi --preview 'pacman -Qil {}' --layout=reverse)

if [[ -n $package ]]; then
   sudo pacman -Rns $package
fi
