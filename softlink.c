#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main(int argc, char const *argv[])
{
    size_t length = 100;
    char *input_string = malloc(100 + 1);
    
    // size_t bytes_read = getline(&input_string, &length, stdin);
    // int input = atoi(input_string);
    // printf("input: %d, (%ld)\n", input);
    // int (*test)(int) = dlsym(lib_handle, "test");
    // int output = (*test)(input);
    // printf("test(%d) = %d \n", input, output);

    while (getline(&input_string, &length, stdin) > 1) {
        int input = atoi(input_string);
        
        // printf("input: %d, (%ld)\n", input);
        void *lib_handle = dlopen("./libtest.dylib", RTLD_NOW);
        int (*test)(int) = dlsym(lib_handle, "test");

        int output = (*test)(input);
        printf("test(%d) = %d \n", input, output);

        dlclose(lib_handle);
    }

    free(input_string);


    return 0;
}