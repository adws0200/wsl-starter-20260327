SHELL := /bin/bash

.PHONY: check lint test node serve py py-serve bootstrap init-node init-python hooks

check:
	npm run check

lint:
	npm run lint

test:
	npm run test

node:
	npm run dev

serve:
	npm run serve

py:
	npm run py

py-serve:
	npm run py:serve

bootstrap:
	bash scripts/bootstrap.sh

init-node:
	bash scripts/init_node.sh

init-python:
	bash scripts/init_python.sh

hooks:
	bash scripts/install_hooks.sh
