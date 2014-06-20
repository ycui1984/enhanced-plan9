#include "../port/rmap.c"

extern long read(int, void*, long);
extern void exits(char*);

static RMap rm1 = {"1"};
static RMap rm2 = {"2"};


static int
fmtP(Fmt* f)
{
	uintmem pa;

	pa = va_arg(f->args, uintmem);

	if(f->flags & FmtSharp)
		return fmtprint(f, "%#16.16llux", pa);

	return fmtprint(f, "%llud", pa);
}

void
main(int argc, char **argv)
{
	char line[128], *p;
	int n;

	fmtinstall('P', fmtP);
	while((n = read(0, line, sizeof(line))) > 0){
		line[n-1] = 0;
		p = strchr(line, ' ');
		if(p == nil){
			print("count\n");
			continue;
		}
		*p++ = 0;
		rmapfree(&rm1, strtoull(line, nil, 0), strtoull(p, nil, 0));
	}
	rmapgaps(&rm2, &rm1);
	rmapprint(&rm1);
	rmapprint(&rm2);
	exits(0);
}
