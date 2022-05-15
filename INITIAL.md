
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

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig='vim ~/.config/nvim/init.vim'

alias ls='ls -1a'
alias vim="nvim"
alias tap='adb shell input keyevent 82'
```

5. `brew install git`
6. `brew install neovim`
7. Install powerlevel10k. `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
8. `brew install tmux`
9. Tmux plugin manager `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
10. `git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack`
11. Configure vim 
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
