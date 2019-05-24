# Load pure prompt https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Load plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/dotfiles/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# Custom aliases
alias c="code .";
alias o="open .";
alias ..='cd ..';

# Hidden files aliases
alias show_dotfiles="defaults write com.apple.Finder AppleShowAllFiles true; killall Finder"
alias hide_dotfiles="defaults write com.apple.Finder AppleShowAllFiles false; killall Finder"

# Custom Git aliases
alias git=hub;
alias gs="git status";
alias gc="git commit";
alias gcm="git commit -m";
alias gcma="git commit --amend";
alias gd="git diff";
alias gdc="git diff --cached";
alias gaa="git add -A";
alias gai="git add -i";
alias gco="git checkout";
alias gm="git merge";
alias gpl="git pull --rebase";
alias gps="git push";
alias gb="git branch";
alias gf="git fetch";
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
alias gnope="git checkout ."

# "Kill frozen touchbar" alias, thank you Apple !!!
alias killbar='sudo pkill "TouchBarServer"';

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export LANG=en_US.UTF-8
DEFAULT_USER=`whoami`

