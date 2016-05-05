CC=gcc
IDIR=../include 

CFLAGS=-O2 -Wall 
CFLAGS += -I../lib
#Uncomment for extra debug output
CFLAGS += -DATCA_DEBUG
# common sources
COMMON_SRC := ./acqDataProc.c ../lib/atca-ioc-int-lib.c

VPATH := ../lib
#src1:../src2

COMMON_OBJS := $(patsubst %.c, %.o, $(notdir $(COMMON_SRC)))

#OBJ = atca-ioc-int-lib.o 
#DEPS = atca-ioc-int-lib.h common.h
LDFLAGS =  -lconfig -lm # -lrt -lrt


default: acqDataProc 

#%.o: %.c $(DEPS)
%.o: %.c Makefile
	@echo creating $@ ,  $(COMMON_OBJS)
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR)

acqDataProc: $(COMMON_OBJS) #acqDataProc.o 
	$(CC) -o $@ $^  $(LDFLAGS) $(CFLAGS) -I$(IDIR)


testDAC: $(OBJ) testDAC.o 
	$(CC) -o $@ $^ $(CFLAGS) -I$(IDIR)

calcInt: $(OBJ) calcInt.o 
	$(CC) -o $@ $^ $(CFLAGS) -I$(IDIR)  $(LDFLAGS)



#all:
#$(CC) -O2 -Wall -I../include -o testAQC  testAQC.c
#	$(CC) -O3 -Wall -I../include -o MenuTeste_IPP_Seno -lm MenuTeste_IPP_Seno.c -lrt

clean:
	rm -f  *.o *~
#	rm testAQC testAQCsav testDAC testINT32



