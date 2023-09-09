vim_deploy:
	cp -R ./.config/nvim ~/.config
zsh_deploy:
	cp .zshrc ~/
tmux_deploy:
	tmux source .tmux.conf && cp .tmux.conf ~/
