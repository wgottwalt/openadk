#include <stdio.h>
#include <sys/reboot.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
	int pid;

	sync();
	if((pid=fork()) == 0) {
		reboot(0x4321fedc);
		_exit(0);
	}
	waitpid(pid, NULL, 0);
	return(0);
}
