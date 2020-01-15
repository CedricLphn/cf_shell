#include <stdio.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char* argv[]) {
    // Hello
    printf("Bonjour");

    // Initialize char
    char c;

    // strcpy()
    // sprintf()
    // strlen()


    // // Loop for read argument
    // for(int i = 0; i < argc; i++) {
    //     printf("%s\n", argv[i]);
    // }

    // Loop for read
    while(read(0, &c, 1) == 1) {
        // Write in std 1
        write(1, &c, 1);

        // Loop for read argument
        for(int i = 0; i < argc; i++) {
            if(argv[i] == 'O') {
                printf("C OK");
            }
        }

    }

    return 0;
}