# Dotfiles and configurations

## Setup 

Create a bare repository in the home directory to manage the dotfiles.

	git clone --bare git@github.com:j-miguel/dotfiles.git $HOME/.dotfiles
	alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
	config checkout
	config config --local status.showUntrackedFiles no
	pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
