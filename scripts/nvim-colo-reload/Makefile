.POSIX:
PREFIX = ~/.local
.PHONY: all install uninstall

all: nvim-wrap neovim-colo-reload

nvim-wrap:
	cp nvim-wrap.sh nvim-wrap

neovim-colo-reload:
	cp neovim-colo-reload.sh neovim-colo-reload


install: all
	chmod 755 nvim-wrap
	chmod 755 neovim-colo-reload
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -vf nvim-wrap ${DESTDIR}${PREFIX}/bin
	cp -vf neovim-colo-reload ${DESTDIR}${PREFIX}/bin
uninstall:
	rm -vf ${DESTDIR}${PREFIX}/bin/nvim-wrap
	rm -vf ${DESTDIR}${PREFIX}/bin/neovim-colo-reload
clean:
	rm -vf nvim-wrap neovim-colo-reload 

