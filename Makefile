.PHONY: setup zsh tmux git docker aerospace vimlua brew docker-compose fliqlo fonts gemini jenv nvim

# Main setup target
setup:
	@echo "Setting up all modules..."
	@for script in $$(find . -name "bootstrap.sh" | sort); do \
		echo "Running $$script setup..."; \
		$$script setup; \
	done

# Individual module targets
zsh:
	./zsh/bootstrap.sh apply

tmux:
	./tmux/bootstrap.sh apply

git:
	./git/bootstrap.sh apply

docker:
	./docker/bootstrap.sh apply

aerospace:
	./aerospace/bootstrap.sh apply

vimlua:
	./vimlua/bootstrap.sh apply

docker-compose:
	./docker-compose/bootstrap.sh install

fliqlo:
	./fliqlo/bootstrap.sh install

fonts:
	./fonts/bootstrap.sh install

nvim:
	./nvim/bootstrap.sh install
