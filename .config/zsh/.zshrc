# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# PLUGIN HELPER
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if ! [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
    # zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
    zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
}

# PATH
path+='/home/j-miguel/.cargo/bin'
path+='/home/j-miguel/.local/bin'

export PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# ALIASES/BINDS
bindkey '^[' clear-screen
alias win='cd /mnt/c/Users/João\ Miguel/'
alias ls="ls --color"
alias ...='cd ../..'
alias lsd='ls -aFhlG'
alias size='du -sckx * | sort -nr'
alias cat='bat'
alias catt='cat'

# GIT
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gs="git status"
alias gss="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gsss="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''   %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# PLUGINS
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# GENERAL
unsetopt beep
setopt auto_cd

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# HISTORY
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt inc_append_history_time
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_find_no_dups

# CORECTION
setopt correct #commands
setopt correctall #arguments

# COMPLETION
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

export EDITOR="vim"

ex() 
{
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.bz2) tar xvjf $1;;
			*.tar.gz) tar xvzf $1;;
			*.tar.xz) tar xvJf $1;;
			*.tar.lzma) tar --lzma xvf $1;;
			*.bz2) bunzip $1;;
			*.rar) unrar $1;;
			*.gz) gunzip $1;;
			*.tar) tar xvf $1;;
			*.tbz2) tar xvjf $1;;
			*.tgz) tar xvzf $1;;
			*.zip) unzip $1;;
			*.Z) uncompress $1;;
			*.7z) 7z x $1;;
			*.dmg) hdiutul mount $1;; # mount OS X disk images
			*) echo "'$1' cannot be extracted via >ex<";;
			esac
			else
				echo "'$1' is not a valid file"
			fi
}

# source /usr/share/zsh-theme-powerlevel9k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/plugins/.p10k.zsh ]] || source ~/.config/zsh/plugins/.p10k.zsh

# Syntax Highlighting
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

