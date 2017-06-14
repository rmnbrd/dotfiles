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
alias gb="git branch";
alias gm="git merge";
alias gpr="git pull-request -o";

# Hub alias
alias git=hub;
alias g=git;

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Colors for Prompt
CYAN=$(tput setaf 6);
YELLOW=$(tput setaf 3);
WHITE=$(tput sgr0)

function parse_git_branch {
 git rev-parse --git-dir &> /dev/null
 git_status="$(git status 2> /dev/null)"
 branch_pattern="^On branch ([^${IFS}]*)"
 remote_pattern="Your branch is (.*) of"
 diverge_pattern="Your branch and (.*) have diverged"
 # add an else if or two here if you want to get more specific
 if [[ ${git_status} =~ ${remote_pattern} ]]; then
   if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
     remote="${YELLOW}↑"
   else
     remote="${YELLOW}↓"
   fi
 fi
 if [[ ${git_status} =~ ${diverge_pattern} ]]; then
   remote="${YELLOW}↕"
 fi
 if [[ ${git_status} =~ ${branch_pattern} ]]; then
   branch=${BASH_REMATCH[1]}
   echo " (${branch}) ${remote}"
 fi
}

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

# Default Prompt
PS1="\n${YELLOW}\w${CYAN}\$(parse_git_branch) ${WHITE}\n✨  ";

# Auto-cd
shopt -s autocd
