SHELL := /bin/bash

.PHONY: check node py bootstrap

check:
	npm run check

node:
	npm run dev

py:
	npm run py

bootstrap:
	bash scripts/bootstrap.sh
