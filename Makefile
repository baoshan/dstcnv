TARGET = dstcnv
LIBDIR = libdstdec
OBJECT = $(TARGET).o
LIB    = $(LIBDIR)/libdstdec.a
ARCH   = -arch x86_64 -arch arm64
CFLAGS = -O3 -Wall $(ARCH) -I$(LIBDIR)
CC     = gcc
RM     = rm -f

$(TARGET) : $(OBJECT) $(LIB)
	$(CC) $(CFLAGS) $(OBJECT) $(LIB) -lpthread -o $(TARGET)

$(LIB) :
	$(MAKE) CFLAGS="-O3 $(ARCH)" -C $(LIBDIR)

.PHONY : all clean

all : $(LIB) $(TARGET)

clean :
	$(RM) $(TARGET) $(OBJECT)
	$(MAKE) -C $(LIBDIR) clean
