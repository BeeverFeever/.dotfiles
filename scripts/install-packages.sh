#!/usr/bin/env bash

package=$(pacman -Slq | fzf --multi --preview 'pacman -Qil {}' --layout=reverse)

if [[ -n $package ]]; then
   sudo pacman -S $package
fi
