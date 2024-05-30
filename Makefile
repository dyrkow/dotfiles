VIM_CONFIG_DIR = ~/.config/nvim

install:
	./scripts/install.sh

vim-clean:
	rm -rf $(VIM_CONFIG_DIR)

vimconf: vim-clean
	cp -R ./vim $(VIM_CONFIG_DIR)

vimluaconf: vim-clean
	cp -R ./vimlua $(VIM_CONFIG_DIR)

zshconf:
	cp ./zsh/.zshrc ~/

font:
	./scripts/fonts.sh

tmuxconf:
	tmux source ./tmux/.tmux.conf && cp ./tmux/.tmux.conf ~/

gitconf:
	cp ./git/.gitconfig ~/

dockerconf:
	cp ./docker/config.json ~/.docker

# Shut up, American bitches
dockerdaemonconf:
	cp ./docker/daemon.json ~/.docker

