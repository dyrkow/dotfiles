.PHONY: bootstrap install apply %
SHELL := /bin/bash

bootstrap install apply:
	@bash scripts/apps.sh $@ "$$(echo '$(MAKECMDGOALS)' | awk '{print $$2}')"

# Consume the extra <app> goal for `make <cmd> <app>`
%:
	@:
