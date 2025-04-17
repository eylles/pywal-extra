.POSIX:
PREFIX = ${HOME}/.local
.PHONY: all install uninstall clean
NAME = fzwal

all: $(NAME)

$(NAME):
	cp fzwal16.sh $(NAME)

install: $(NAME)
	mkdir -p ${DESTDIR}${PREFIX}/bin
	chmod 755 $(NAME)
	cp -vf $(NAME) ${DESTDIR}${PREFIX}/bin/$(NAME)
uninstall:
	rm -vf ${DESTDIR}${PREFIX}/bin/$(NAME)
clean:
	rm -vrf $(NAME)

