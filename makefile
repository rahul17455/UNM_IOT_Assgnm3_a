BUILDROOT_HOME=/home/rahul/IOTv/buildroot-2020.02

CC=$(BUILDROOT_HOME)/output/host/usr/bin/arm-linux-gcc
CCFLAGS=--sysroot=$(BUILDROOT_HOME)/output/staging
INCLUDES=
LFLAGS=

LIBS=-lcurl -lpthread

SRC=requestor.c
OBJ=$(SRC:.c=.o)
MAIN=test

RM=rm -rf

.c.o:
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(MAIN): $(OBJ)
		$(CC) $(CCFLAGS) $(INCLUDES) -o $(MAIN) $(OBJ) $(LFLAGS) $(LIBS)

all: $(MAIN)

clear: 
		$(RM) $(MAIN) *.o *~