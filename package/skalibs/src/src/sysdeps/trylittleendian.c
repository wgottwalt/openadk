#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __LITTLE_ENDIAN) ||      \
       defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_LITTLE_ENDIAN__) || \
       defined(__LITTLE_ENDIAN) ||                                     \
       defined(__ARMEL__) ||                                           \
       defined(__THUMBEL__) ||                                 \
       defined(__AARCH64EL__) ||                                       \
       defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
#define YEAH
#else
#error "not little endian"
#endif

int main(void)
{
       return 0;
}
