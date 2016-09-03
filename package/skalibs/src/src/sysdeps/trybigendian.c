#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||        \
       defined(__BYTE_ORDER__) && (__BYTE_ORDER__  == __ORDER_BIG_ENDIAN__) || \
       defined(__BIG_ENDIAN) ||                                       \
       defined(__ARMEB__) ||                                          \
       defined(__THUMBEB__) ||                                \
       defined(__AARCH64EB__) ||                                      \
       defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)
#define YEAH
#else
#error "not big endian"
#endif

int main(void)
{
       return 0;
}

