	
	git clone --bare git@github.com:j-miguel/dotfiles.git $HOME/.dotfiles
	alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME
	config config --local status.showUntrackedFiles no
