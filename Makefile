VIM_CONFIG_DIR = ~/.config/nvim
install:
	./scripts/install.sh
clean-vim:
	rm -rf $(VIM_CONFIG_DIR)
config-vim: clean-vim
	cp -R ./vim $(VIM_CONFIG_DIR)
config-zsh:
	cp ./zsh/.zshrc ~/
config-tmux:
	tmux source ./tmux/.tmux.conf && cp ./tmux/.tmux.conf ~/
