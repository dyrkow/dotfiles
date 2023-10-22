vim:
	cp -R ./.config/nvim ~/.config
zsh:
	cp .zshrc ~/
tmux:
	tmux source .tmux.conf && cp .tmux.conf ~/
