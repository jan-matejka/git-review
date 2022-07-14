.DEFAULT_GOAL := build

prefix ?= /usr/local
bindir ?= $(prefix)/bin

build:

	# NOOP

.PHONY: install
install:

	install -m755 src/git-review.zsh $(DESTDIR)$(bindir)/git-review


.PHONY: install-home
install-home:

	$(MAKE) install prefix=$(HOME)/.local
