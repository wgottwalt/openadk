#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

extern char** environ;

int main (int argc, char **argv)
{
    char** e;
    char* v;
    int i;
   
    if (argc == 1) {
        e = environ;
        while (*e) {
	    write(1, *e, strlen(*e));
	    write(1, "\n", 1);
            e++;
        }
    } else {
        for (i=1; i<argc; i++) {
            v = getenv(argv[i]);
            if (v) {
		write(1, v, strlen(v));
		write(1, "\n", 1);
            }
        }
    }

    return 0;
}

