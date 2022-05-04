
1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Add brew to .zshrc `export PATH="/opt/homebrew/bin:$PATH"`
3. `brew install --cask iterm2`
4. `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`



alias ls='ls -1a'
alias tap='adb shell input keyevent 82'

alias gs='git status'
alias gp='git pull'
alias gh='git push'

alias vimconfig='vim ~/.config/nvim/init.vim'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
