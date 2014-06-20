#include <u.h>
#include <libc.h>

/* return type needs to be uintptr */
uintptr
getcallerpc(void *x)
{
	return (((uintptr*)(x))[-1]);
}
