.PHONY: bootstrap install apply %
SHELL := /bin/bash

# Makefile dispatches to apps/<program>/bootstrap.sh
# Interface:
#   make bootstrap [program]  -> install then apply
#   make install [program]    -> install
#   make apply [program]      -> apply

bootstrap:
	@prog="$$(echo "$(MAKECMDGOALS)" | awk '{print $$2}')" ; \
	if [ -z "$$prog" ]; then \
		$(MAKE) --no-print-directory install ; \
		$(MAKE) --no-print-directory apply ; \
	else \
		bash "./apps/$$prog/bootstrap.sh" install ; \
		bash "./apps/$$prog/bootstrap.sh" apply ; \
	fi

install:
	@prog="$$(echo "$(MAKECMDGOALS)" | awk '{print $$2}')" ; \
	if [ -z "$$prog" ]; then \
		for script in ./apps/*/bootstrap.sh; do \
			bash "$$script" install; \
		done; \
	else \
		bash "./apps/$$prog/bootstrap.sh" install ; \
	fi

apply:
	@prog="$$(echo "$(MAKECMDGOALS)" | awk '{print $$2}')" ; \
	if [ -z "$$prog" ]; then \
		for script in ./apps/*/bootstrap.sh; do \
			bash "$$script" apply; \
		done; \
	else \
		bash "./apps/$$prog/bootstrap.sh" apply ; \
	fi

# Consume the extra <program> goal for `make <cmd> <program>`
%:
	@:

