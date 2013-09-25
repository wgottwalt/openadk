/* Just like strncpy but shift-case in transit and forces null termination */
char *
lcstring(char *d, char *s, int n)
{
    char *original_d = d;
    char c;

    if ((s == 0) || (d == 0))
        return 0;               /* just to be safe */
    while (n) {
        c = *s++;
        if (isupper(c))
            c = tolower(c);
        *d++ = c;
        if (c == 0)
            break;              /* quit after transferring null */
        if (--n == 0)
            *(d - 1) = 0;       /* make sure null terminated */
    }
    return original_d;
}

