#* Variables
SHELL := /usr/bin/env bash
PYTHON := python
PYTHONPATH := `pwd`

#* Test Template
.PHONY: test
test:
	copier --vcs-ref HEAD --defaults ./ ../test/test-project