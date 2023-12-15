VIM_CONFIG_DIR = ~/.config/nvim
install:
	./scripts/install.sh
clean-vim:
	rm -rf $(VIM_CONFIG_DIR)
config-vim: clean-vim
	cp -R ./.config/nvim ~/.config
config-vim-lua: clean-vim
	cp ./vim/init.lua ~/.config/nvim/
config-zsh:
	cp .zshrc ~/
config-tmux:
	tmux source .tmux.conf && cp .tmux.conf ~/
