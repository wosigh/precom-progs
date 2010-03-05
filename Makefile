all:
	${CC} ${CFLAGS} -o novacom -I${CC_ROOT}/usr/include -L${CC_ROOT}/usr/lib ./src/novacom.c -lusb
	
clean:
	rm novacom
