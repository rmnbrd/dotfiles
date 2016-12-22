# Greatly inspired by https://github.com/kentcdodds/dotfiles/blob/master/.bash_profile

export TERM=xterm-256color

# Personal aliases
alias a="atom .";
alias ll="ls -al";
alias ..="cd ../";
alias ..l="cd ../ && ll";


# Git aliases
alias gs="git status";
alias gd="git diff";
alias gl="git pull";
alias gp="git push";
alias ga="git add . && gs";
alias gc="git commit";
alias gf="git fetch origin";
alias gch="git checkout";
alias gm="git merge";


# Colors for Prompt
GRAY=$(tput setaf 4);
YELLOW=$(tput setaf 3);
WHITE=$(tput setaf 7)

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

rand() {
  printf $((  $1 *  RANDOM  / 32767   ))
}
rand_element () {
  local -a th=("$@")
  unset th[0]
  printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}

# Default Prompt
PS1="\n${YELLOW}\w${GRAY}\$(git_branch)${WHITE}\n$(rand_element 🤡 😜 🔥 🚀 👻 👾 🍕 😄 🍰 🌵)  ";

# Auto-cd
shopt -s autocd


