NAME = protobuf$(NAME_VERSION)
SOURCE_URL = https://protobuf.googlecode.com/files/protobuf-$(VERSION).tar.gz 

PROTO_INSTALL_DIR = /opt/protobuf/
FPM_SOURCE = dir

PACKAGE_URL = https://code.google.com/p/protobuf/
PACKAGE_DESCRIPTION = Google Protocol Buffers

include ../../include/base.mk

export DESTDIR

extract: fetch default_build
	cd $(BUILDDIR); tar xzf $(CACHEDIR)/$(notdir $(SOURCE_URL))

build: extract
	cd $(BUILDDIR)/protobuf-$(VERSION); \
	./configure --prefix=$(PROTO_INSTALL_DIR)/$(VERSION)/ && make install
