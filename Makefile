.PHONY: zsh tmux git docker aerospace

VIM_CONFIG_DIR = $(HOME)/.config/nvim

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

font:
	./scripts/fonts.sh

tmux:
	tmux source ./tmux/.tmux.conf && cp ./tmux/.tmux.conf ~/

git:
	cp ./git/.gitconfig ~/

docker:
	cp ./docker/config.json ~/.docker

dockerdaemon:
	cp ./docker/daemon.json ~/.docker

aerospace:
	./aerospace/apply.sh
