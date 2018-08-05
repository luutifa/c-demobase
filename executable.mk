include config.mk

TARGET=demo
SOURCES=main.c player.c demo.c gl_util.c read_file.c gl_matrix.c

LFLAGS=-rdynamic -L$(BASE)lib/rocket/lib
LDLIBS+=-lm -ldl $(shell pkg-config --libs $(PKGS))
release:LDLIBS+=-lrocket-player
debug:LDLIBS+=-lrocket

include common.mk

.PHONY: install

install: $(TARGET) LICENSE demo.sh
	install -d $(PREFIX)/bin
	install -d $(PREFIX)/src
	cp $(TARGET) $(PREFIX)/bin/
	cp *.vert $(PREFIX)/bin/ || :
	cp *.frag $(PREFIX)/bin/ || :
	cp *.track $(PREFIX)/bin/ || :
	cp music.ogg $(PREFIX)/bin/ || :
	cp README.md $(PREFIX)/ || :
	cp LICENSE $(PREFIX)/
	cp demo.sh $(PREFIX)/
	git clone ./ $(PREFIX)/src
	cd $(PREFIX)/src; git remote remove origin
