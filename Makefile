VIM_CONFIG_DIR = ~/.config/nvim

install:
	./scripts/install.sh

vim-clean:
	rm -rf $(VIM_CONFIG_DIR)

vim: vim-clean
	cp -R ./vim $(VIM_CONFIG_DIR)

vimlua: vim-clean
	cp -R ./vimlua $(VIM_CONFIG_DIR)

zsh:
	cp ./zsh/.zshrc ~/

tmux:
	tmux source ./tmux/.tmux.conf && cp ./tmux/.tmux.conf ~/
