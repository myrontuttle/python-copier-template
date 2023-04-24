#* Variables
SHELL := /usr/bin/env bash
PYTHON := python
PYTHONPATH := `pwd`

#* Test Template
.PHONY: test
test:
	copier --vcs-ref HEAD --defaults --data "minimal_python_version='3.9'" ./ ../test/test-project