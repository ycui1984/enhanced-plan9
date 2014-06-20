#include <u.h>
#include <libc.h>

#define INCR ((vlong)(1ULL<<32))

vlong j;

void
main(void)
{
			switch(j){
			case 1:
			case 2:
			case 4:
			case 8:
			case 16:
			case INCR+1LL:
				print("0x%016llx %12lld  0x%08x %2d\n",
					(uvlong)j, j, (uint)j, (int)j);
				break;
			}
}
