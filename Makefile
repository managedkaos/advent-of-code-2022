SUBDIRS := $(wildcard ./Day*)

all test: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
