#set -o vi
#source ~/.git-prompt.sh
#alias ls='ls --color=auto'
#alias ls='ls -l --color=auto'
alias tmux="tmux -2 -u"
alias grep="grep --color=always"
alias gvim="gvim.exe"
alias explore="explorer.exe ."
alias explorer="explorer.exe"
#alias tortoisemerge="tortoisemerge.exe"
#alias git="'/mnt/c/Program Files/Git/bin/git.exe'"
alias g='git'
alias gd='git diff -w'
alias gdc='git diff -w --cached'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gr='git restore --staged'
alias gpq='git co QA && git merge dev && git push && git co dev'
alias gpm='git co main && git merge QA && git push && git co dev'
alias gpqm='git co QA && git merge dev && git push && git co main && git merge QA && git push && git co dev'
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

set HIST=
set HISTSIZE=

# Replace '|' with '\r|' to make this more readable:   :s/|/\r|/g

alias gs='git status'

#| sed "/.*use.*git reset HEAD.*to unstage/d" 


if [ -n "$BASH_VERSION" ]; then
	# Shell is bash
	if [ -t 1 ]; then
		# Launch Zsh
		#exec zsh
	else
		eval `dircolors /root/.dircolors`
		declare -x PS1="\\[\\033]0;\$TITLEPREFIX:\${PWD//[^[:ascii:]]/?}\\007\\]\\n\\[\\033[32m\\]\\u@\\h \\[\\033[35m\\] \\[\\033[33m\\]\\w\\[\\033[36m\\]\`__git_ps1\`\\[\\033[0m\\]\\n\$ "
		eval $(dircolors -b $HOME/.dircolors)
	fi
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin"


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

if ! { [ "$TERM" = "screen"  ] && [ -n "$TMUX"  ];  } then
	cd ~
fi
