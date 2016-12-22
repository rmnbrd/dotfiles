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
alias gp="git pull";
alias gpush="git push";
alias ga="git add .";
alias gc="git commit -m $1";
alias gf="git fetch";
alias gch="git checkout";
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
WHITE=$(tput setaf 7)

# Emojis
emojis=("🤙" "✨" "🌵" "🍕" "🔥" "🐧")
RANDOM=$$$(date +%s)

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

random_emoji() {
  printf ${emojis[$RANDOM % ${#emojis[@]} ]}
}

# Default Prompt
PS1="\n${YELLOW}\w${CYAN}\$(git_branch)${WHITE}\n$(random_emoji)  ";

# Auto-cd
shopt -s autocd
