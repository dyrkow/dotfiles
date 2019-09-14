alias ls='ls -1a'
alias lint='eslint --init'
alias debug='iron-node'
alias config='mvim ~/.vimrc_macvim'
alias nconfig='nvim ~/.config/nvim/init.vim'
alias webpack='./node_modules/.bin/webpack'
alias work='cd ~/documents/work/'
alias sshvyksa='ssh -p 4122 root@5.101.114.219'
alias tap='adb shell input keyevent 82'

export ANDROID_HOME=/Users/dyrkov/Library/Android/sdk

export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/Lybrary/Android/sdk/platform-tools

COLOR_RED=$(tput setaf 160);
COLOR_YELLOW=$(tput setaf 226);
COLOR_PURPUR=$(tput setaf 51); COLOR_GREEN=$(tput setaf 47);
COLOR_BLUE=$(tput setaf 63);
COLOR_WHITE=$(tput setaf 15); COLOR_RESET=$(tput sgr0);

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_GREEN
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_PURPUR
  else
    echo -e $COLOR_RED
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit "
  fi
}

function git_branch_char {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "●"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "●"
  fi
}

function git_branch_end {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo ")"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo ")"
  fi
}

# PS1="\[$COLOR_GREEN\]\u@"
PS1="\[$COLOR_YELLOW\]\h "
PS1+="\[$COLOR_GREEN\]» "
PS1+="\[$COLOR_WHITE\]\W "
PS1+="\[$COLOR_PURPUR\]"
PS1+="\[\$(git_branch)\]"
PS1+="\[\$(git_color)\]"
PS1+="\[\$(git_branch_char)\]"
PS1+="\[$COLOR_PURPUR\]"
PS1+="\[\$(git_branch_end)\]"
PS1+="\[$COLOR_RESET\] "

export PS1
