. ~/z.sh

#set -o vi
#source ~/.git-prompt.sh
#alias ls='ls --color=auto'
#alias ls='ls -l --color=auto'
alias tmux="tmux -2 -u"
alias grep="grep --color=always"
alias gvim="gvim.exe"
alias explore="explorer.exe ."
alias explorer="explorer.exe"
alias tortoisemerge="tortoisemerge.exe"
#alias git="'/mnt/c/Program Files/Git/bin/git.exe'"
alias g='git'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gl='git log | vim -R -'
alias x='exit'

alias cd..='cd ..'
alias ..='cd ../'
alias ...='cd ../../'
alias ...='cd ../../'
alias 3..='cd ../../../'
alias 4..='cd ../../../../'
alias 5..='cd ../../../../../'
alias 6..='cd ../../../../../../'

# Replace '|' with '\r|' to make this more readable:   :s/|/\r|/g

alias gs='pretty_git_status'
# alias gs='"/mnt/c/Program Files/Git/bin/git.exe" status | sed -r "s/^(.*On branch )(.*$)/\r\n\1$(printf "\033[4m\033[1m\033[35m")\2$(printf "\033[0m")/" | sed -r "s/^(.*Your branch is )(.*)( with | of )('"'"'.*'"'"')\.?( by )?(.*commit[s]?.*)?.*\./\1$(printf "\033[4m\033[1m\033[35m")\2$(printf "\033[0m")\3$(printf "\033[4m\033[1m\033[35m")\4$(printf "\033[0m")\5$(printf "\033[4m\033[1m\033[35m")\6$(printf "\033[0m").\r\n/" | sed -r "s/^(.*Your branch is.*up-to-date.*)/$(printf "\033[1m\033[32m\u2714")$(printf "\033[0m") \1/" | sed -r "s/(^.*Changes to be committed:.*$)/$(printf "\033[4m")\r\n\1$(printf "\033[0m")/" | sed -r "s/(^.*Changes not staged for commit:.*$)/$(printf "\033[4m")\1$(printf "\033[0m")/" | sed -r "s/(^.*Untracked files:.*$)/$(printf "\033[4m")\1$(printf "\033[0m")/" | sed -r "s/(^.*deleted:.*$)/$(printf "\033[31m")x\1$(printf "\033[0m")/" | sed -r "s/^.*(deleted:.*$)/$(printf "\033[31m")x       \1$(printf "\033[0m")/" | sed -r "s/(^.*modified:.*$)/$(printf "\033[33m")*\1$(printf "\033[0m")/" | sed -r "s/(^.*added:.*$)/$(printf "\033[32m")+\1$(printf "\033[0m")/" | sed -r "s/(^.*new file:.*$)/$(printf "\033[32m")+\1$(printf "\033[0m")/" | sed "/.*to include in what will be committed/d" | sed "/.*use.*git add.*to update what will/d" | sed "/.*use.*git checkout.*to discard changes in working directory/d" | sed "/.*use.*git push.*to publish your local commits.*/d" | sed -r "$ s/(.*)/\1\n______________________________________________________________________/g"'

#| sed "/.*use.*git reset HEAD.*to unstage/d" 


if [ -n "$BASH_VERSION" ]; then
	# Shell is bash
	if [ -t 1 ]; then
		# Launch Zsh
		exec zsh
	else
		eval `dircolors /root/.dircolors`
		declare -x PS1="\\[\\033]0;\$TITLEPREFIX:\${PWD//[^[:ascii:]]/?}\\007\\]\\n\\[\\033[32m\\]\\u@\\h \\[\\033[35m\\] \\[\\033[33m\\]\\w\\[\\033[36m\\]\`__git_ps1\`\\[\\033[0m\\]\\n\$ "
		eval $(dircolors -b $HOME/.dircolors)
	fi
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
#export PATH="$PATH:/mnt/c/Program Files (x86)/vim/vim80"


#cp ~/.profile ~/.bash* ~/.gitconfig ~/.inputrc ~/.zshrc /mnt/c/Users/ianwi/.vimrc /mnt/c/Users/ianwi/Dropbox\ \(Personal\)/dotfiles/dave-pc/

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
#if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -f __init_nvm)" = function ]; then
#	export NVM_DIR="$HOME/.nvm"
#	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
#	declare -a __node_commands=(nvm `find -L $NVM_DIR/versions/*/*/bin -type f -exec basename {} \; | sort -u`)
#	function __init_nvm() {
#		for i in "${__node_commands[@]}"; do unalias $i; done
#		. "$NVM_DIR"/nvm.sh
#		unset __node_commands
#		unset -f __init_nvm
#	}
#	for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
#fi

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

