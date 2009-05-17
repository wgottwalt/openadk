#ifndef __UCLIBC__
#define strlcpy rep_strlcpy
size_t rep_strlcpy(char *d, const char *s, size_t bufsize);
#define strlcat rep_strlcat
size_t rep_strlcat(char *d, const char *s, size_t bufsize);
#endif
