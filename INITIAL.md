
1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Add brew to .zshrc `export PATH="/opt/homebrew/bin:$PATH"`
3. `brew install --cask iterm2`
4. `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`


```
alias gap="git add -p"
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gs="git status"
alias gpf="git push --force"
alias grh="git reset --hard"
```

5. `brew install git`

alias ls='ls -1a'
alias tap='adb shell input keyevent 82'

alias vimconfig='vim ~/.config/nvim/init.vim'
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
