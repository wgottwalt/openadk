// This file is part of the OpenADK project. OpenADK is copyrighted
// material, please see the LICENCE file in the top-level directory.

#include <unistd.h>
#include <stdio.h>

int main()
{
  return execlp("login\0","login\0","-f\0", "root\0" ,0);
}
