#include <iostream>
#include <cstdlib>
using namespace std;
#include "endianPPC.h"

#ifndef _MSC_VER
#include <sys/param.h>
#if defined(__FreeBSD__) || defined(__APPLE__) || defined(__MORPHOS__)
#include <machine/endian.h>
#else
#include <endian.h>
#endif
#endif

bool isBigEndian(void)
{
#ifdef BYTE_ORDER
    	return BYTE_ORDER == BIG_ENDIAN;
#elif defined _MSC_VER
	return false; // Modern VC++ only runs on x86, x64 and ARM, doesn't require big/little endian conversion
#else
    return __BYTE_ORDER == __BIG_ENDIAN;
#endif
}
