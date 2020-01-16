#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>



int main(int argc, char* argv[]) {
    // Hello
    printf("Bonjour\n");
    fflush(stdout);

    // Initialize char
    char a;
    char b;
    // buffers
    char buffE[256];
    char buffK[256];

    char* sensorNames[] = {"thermometer1", "thermometer2", "thermometer3"};
    char matchedOk[2];
    char matchedError[5];
    char sequences[5];


    // Loop for read
    while(read(0, &a, 1) == 1) {
        // Write in std 1
        //write(1, &a, 1);

        if(sizeof(sequences) == 2){

        }
        sequences[]

        int sensorId = rand();

        if(a == 'O') {
            matched[0] = '0';
        }else if(a == 'K'){
            matched[1] = 'K';
        }else if(a == 'E'){

        }else if(a == 'R'){

        }else if(a == 'R'){

        }else if(a == 'R'){

        }else if(a == 'O'){

        }else if(a == 'R')



//        if(a == 'K') {
//
//            char* sensorName = sensorNames[rand()%(2-0 + 1)];
//            int value = rand()%(50-0 + 1);
//            int minValue = rand()%(50-0 + 1);
//            int meanValue = rand()%(50-0 + 1);
//            int maxValue = rand()%(50-0 + 1);
//            sprintf(buffK, "%d:%s:%d:%d:%d:%d\n", sensorId, sensorName, value, minValue, meanValue, maxValue);
//            write(1, buffK, strlen(buffK));
//
//        }else if (a == 'E'){
//            int errorCode = rand()%(1000-0 + 1);
//            sprintf(buffE, "%d:%d:error occurred\n", sensorId, errorCode);
//            write(2, buffE, strlen(buffE));
//        }
//        fflush(stdout);
    }

    return 0;
}

