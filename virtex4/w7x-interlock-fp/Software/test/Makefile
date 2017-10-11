CC=gcc
IDIR=../include

CFLAGS=-O2 -Wall
CFLAGS += -I$(IDIR)

OBJ = atca-ioc-int-lib.o 
DEPS = atca-ioc-int-lib.h common.h
LDFLAGS =  -lrt -lconfig -lm
VPATH=../lib
default: testDAC 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) -I$(IDIR)

testACQ: $(OBJ) testACQ.o 
	$(CC) -o $@ $^ $(CFLAGS) -I$(IDIR)

rtACQ: $(OBJ) rtACQ.o 
	$(CC) -o $@ $^ $(CFLAGS)

testDAC: $(OBJ) testDAC.o 
	$(CC) -o $@ $^ $(CFLAGS) -I$(IDIR)

getDataRT: $(OBJ) getDataRT.o
	$(CC) $(LDFLAGS) -o $@ $^ $(CFLAGS)
# -I$(IDIR)

getDataMem: $(OBJ) getDataMem.o
	$(CC) $(LDFLAGS) -o $@ $^ $(CFLAGS)

testACQsav: $(OBJ) testACQsav.o 
	$(CC) -o $@ $^ $(CFLAGS)

getOffsets: $(OBJ) getOffsets.o 
	$(CC) $(LDFLAGS) -o $@ $^ $(CFLAGS)

calcInt: $(OBJ) calcInt.o 
	$(CC) $(LDFLAGS) -o $@ $^ $(CFLAGS)

testINT32: $(OBJ) testINT32.o 

de_pack:  de_pack.o 
	$(CC) -o $@ $^ $(CFLAGS)

#all:
#$(CC) -O2 -Wall -I../include -o testAQC  testAQC.c
#	$(CC) -O3 -Wall -I../include -o MenuTeste_IPP_Seno -lm MenuTeste_IPP_Seno.c -lrt

clean:
	rm -f  *.o *~
#	rm testAQC testAQCsav testDAC testINT32



