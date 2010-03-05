# If you're cross-compiling and your mingw32 tools are called
# i586-mingw32msvc-gcc and so on, then you can compile libusb-win32
# by running
#    make host_prefix=i586-mingw32msvc all
#

ifdef host_prefix
	override host_prefix := $(host_prefix)-
endif

CC = $(host_prefix)gcc
LD = $(host_prefix)ld

all: libusb
	${CC} ${CFLAGS} -o novacom.exe -I./libusb-win32/src ./src/novacom.c -L./libusb-win32 -lusb -lwsock32 -mno-cygwin
	
libusb:
	$(MAKE) -C libusb-win32 all

clean:
	$(MAKE) -C libusb-win32 clean
	rm -f *.o novacom.exe
	rm -f lib/libusb.a
