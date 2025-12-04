HISTSIZE=2000

PATH=$PATH:/usr/local/bin
PATH=$PATH:$HOME/Documents/dev/utils/bin

export EDITOR=vi
export PATH

# quick paths for current coursework
export sfsu=/Users/m/Documents/SFSU
export dev=/Users/m/Documents/dev

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias chrome='open -a /Applications/Google Chrome.app $1'
# alias ctags="`brew --prefix`/bin/ctags"
alias findexe='find . -perm +0111 -type f'

alias gau='git update-index --assume-unchanged'
alias gl='git lf'
alias gnau='git update-index --no-assume-unchanged'
alias gs='git status'
alias gsau='git ls-files -v | egrep ^[[:lower:]]'
alias standup='git log --since yesterday --author `git config user.email` --pretty=short'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -halG'

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

stty -ixon
