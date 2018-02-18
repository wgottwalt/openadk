// from https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881536

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>

// Mini version of AVPacket
typedef struct AVPacket {
   void *buf;
   int64_t pts;
   int64_t dts;
   uint8_t *data;
   int   size;
} AVPacket;

int avcodec_decode_audio4(void* a, void* b, int* got_frame_ptr, const AVPacket* pkt)
{
    // Ignore null packets
    if (pkt->size == 0)
    {
        *got_frame_ptr = 0;
        return 0;
    }

    // Forward to real function
    int (*orig_decode)(void*, void*, int*, const AVPacket*) =
        dlsym(RTLD_NEXT, "avcodec_decode_audio4");
    return orig_decode(a, b, got_frame_ptr, pkt);
}
