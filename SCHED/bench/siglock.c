#include <u.h>
#include <libc.h>

ulong slaves = 2;
long cnt = 0;
int thecount = 5;
int numCPU = 8;

static void ready_detect(void) {
	ainc(&cnt);
	while (0!=cnt);
}

static void bench(int id) {
	int cnt;

	ready_detect();
	for (cnt = 1; cnt <=thecount; cnt++) 
		siglock(1, 2);
}

static void create_slave(void) {

	int ret;

	for (int i = 0; i<slaves; i++) {
		switch (ret = rfork(RFPROC|RFMEM|RFNOWAIT)) {
			case -1:
				print("error rforking\n");
				exits(0);
			case 0:
				bench(i);
				exits(0);
		}
	}
}

void main() {

	int i;
	
	create_slave();
	while (0 == casl((ulong*)&cnt, slaves, 0));
	/* start */
	ulong start = time(nil);

	Waitmsg *m;
	
	for (i = 0; i<slaves; i++) {
		m = wait();
		free(m);
	}
	
	ulong end = time(nil);
	print("interval = %lud\n", end - start);
	exits(0);
}

