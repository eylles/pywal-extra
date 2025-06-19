.POSIX:
PREFIX = ${HOME}/.local
.PHONY: all install uninstall clean
NAME = ultrakill-wal

all: $(NAME)

$(NAME):
	cp ultrapywal.py $(NAME)
	chmod 755 $(NAME)

install: $(NAME)
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -vf $(NAME) ${DESTDIR}${PREFIX}/bin/$(NAME)
uninstall:
	rm -vf ${DESTDIR}${PREFIX}/bin/$(NAME)
clean:
	rm -vrf $(NAME)

