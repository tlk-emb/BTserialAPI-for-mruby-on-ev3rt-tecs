#include <t_syslog.h>
#include "tBTserial_tecsgen.h"
#include "syssvc/serial.h"

int
eBTserial_bread()
{
	uint8_t buf;

	ER_UINT erlen = serial_rea_dat(SIO_PORT_BT, (char*)&buf, sizeof(buf));
	assert(erlen > 0);

	if(erlen == sizeof(buf))
		return buf;

	return 0;
}

int
eBTserial_bsend(const char* str)
{
	int len = 1;

	ER_UINT erlen = serial_wri_dat(SIO_PORT_BT, str, len);
	assert(erlen > 0);

	if(erlen==len) {
		return 0;
	}

	return -1;
}
