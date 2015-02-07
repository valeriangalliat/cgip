#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    puts("Content-Type: text/plain\n");

    char *addr = getenv("REMOTE_ADDR");

    if (addr) {
        puts(addr);
    }

    return 0;
}
