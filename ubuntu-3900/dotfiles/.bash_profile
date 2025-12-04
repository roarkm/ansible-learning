if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\n\u@\h:\w\n\$ '
fi

HISTSIZE=2000

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

PATH=$PATH:/usr/local/bin

export EDITOR=vi
export PATH

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias chrome='open -a /Applications/Google Chrome.app $1'
alias findexe='find . -perm +0111 -type f'
alias gau='git update-index --assume-unchanged'
alias gl='git lf'
alias gnau='git update-index --no-assume-unchanged'
alias gs='git status'
alias gsau='git ls-files -v | egrep ^[[:lower:]]'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -halG'
alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

stty -ixon
