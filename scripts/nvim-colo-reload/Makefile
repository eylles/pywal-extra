.POSIX:
PREFIX = ~/.local
.PHONY: all install uninstall

all: nvim-wrap nvim-colo-reload

nvim-wrap:
	cp nvim-wrap.sh nvim-wrap

nvim-colo-reload:
	cp nvim-colo-reload.sh nvim-colo-reload


install: all
	chmod 755 nvim-wrap
	chmod 755 nvim-colo-reload
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -vf nvim-wrap ${DESTDIR}${PREFIX}/bin
	cp -vf nvim-colo-reload ${DESTDIR}${PREFIX}/bin
uninstall:
	rm -vf ${DESTDIR}${PREFIX}/bin/nvim-wrap
	rm -vf ${DESTDIR}${PREFIX}/bin/nvim-colo-reload
clean:
	rm -vf nvim-wrap nvim-colo-reload

