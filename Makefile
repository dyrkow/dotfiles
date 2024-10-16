VIM_CONFIG_DIR = ~/.config/nvim

install:
	./scripts/install.sh

vim-clean:
	rm -rf $(VIM_CONFIG_DIR)

cvim: vim-clean
	cp -R ./vim $(VIM_CONFIG_DIR)

cvimlua: vim-clean
	cp -R ./vimlua $(VIM_CONFIG_DIR)

czsh:
	cp ./zsh/.zshrc ~/

font:
	./scripts/fonts.sh

ctmux:
	tmux source ./tmux/.tmux.conf && cp ./tmux/.tmux.conf ~/

cgit:
	cp ./git/.gitconfig ~/

cdocker:
	cp ./docker/config.json ~/.docker

cdockerdaemon:
	cp ./docker/daemon.json ~/.docker

caerospace:
	cp ./aerospace/.aerospace.toml ~/
