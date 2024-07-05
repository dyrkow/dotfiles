###########################################################################
#                                                                         #
#               ███████╗███████╗██╗  ██╗██████╗  ██████╗                  #
#               ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝                  #
#                 ███╔╝ ███████╗███████║██████╔╝██║                       #
#                ███╔╝  ╚════██║██╔══██║██╔══██╗██║                       #
#               ███████╗███████║██║  ██║██║  ██║╚██████╗                  #
#               ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝                  #
#                                                                         #
###########################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#---------------------------------- BASE ---------------------------------#

alias myip="curl http://ipecho.net/plain; echo"
alias ys="yarn start"
alias ysr="yarn start --reset-cache"
alias yrc="yarn --reset-cache"
alias ad="adb devices"
alias c="clear"
alias dc="docker-compose"
alias gap="git add -p"
alias ga="git add"
alias gl="git pull"
alias tx="tmuxinator"
alias gp="git push"
alias gc="git commit"
alias gch="git checkout"
alias gs="git status"
alias gpf="git push --force"
alias gr="git reset"
alias grh="git reset head --hard"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmuxconfig="vim ~/.tmux.conf"
alias vim="nvim"
alias ls="ls -la1"
alias tap="adb shell input keyevent 82"
alias k="kubectl"

#--------------------------------- SYSTEM --------------------------------#

export LANG=es_ES.UTF-8
export EDITOR='vim'
export PATH="/opt/homebrew/bin:$PATH"
export GEM_HOME=~/.gems                                                                     |
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:~/.gems/bin

export KUBECONFIG=~/.kube/config:~/.kube/config_stage
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# исправление проблемы upgrade react-native
export NODE_OPTIONS=--max_old_space_size=16384

export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/dyrkov/yandex-cloud/path.bash.inc' ]; then source '/Users/dyrkov/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/dyrkov/yandex-cloud/completion.zsh.inc' ]; then source '/Users/dyrkov/yandex-cloud/completion.zsh.inc'; fi
