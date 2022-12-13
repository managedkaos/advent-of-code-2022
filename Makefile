SUBDIRS := $(wildcard ./Day*)

all test build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
