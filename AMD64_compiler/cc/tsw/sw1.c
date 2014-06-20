int j;

void
k(void)
{
	switch(j){
	case 1:
	case 2:
	case 4:
	case 0x1000:
		k();
	}
}
