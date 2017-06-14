# Greatly inspired by https://github.com/kentcdodds/dotfiles/blob/master/.bash_profile

export TERM=xterm-256color

# Personal aliases
alias a="atom .";
alias c="code .";
alias o="open .";
alias l="ls";
alias ll="ls -al";
alias ..="cd ../";
alias ..l="cd ../ && ll";

# Git aliases
alias gs="git status";
alias gd="git diff";
alias gpull="git pull";
alias gpush="git push";
alias ga="git add .";
alias gc="git commit -m $1";
alias gf="git fetch";
alias gco="git checkout";
alias gm="git merge";

# Hub alias
alias git=hub;

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Colors for Prompt
CYAN=$(tput setaf 6);
YELLOW=$(tput setaf 3);
WHITE=$(tput sgr0)


function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

# Default Prompt
PS1="\n${YELLOW}\w${CYAN}\$(git_branch)${WHITE}\n❯ ";

# Auto-cd
shopt -s autocd
