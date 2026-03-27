SHELL := /bin/bash

.PHONY: check node serve py bootstrap init-node init-python

check:
	npm run check

node:
	npm run dev

serve:
	npm run serve

py:
	npm run py

bootstrap:
	bash scripts/bootstrap.sh

init-node:
	bash scripts/init_node.sh

init-python:
	bash scripts/init_python.sh
