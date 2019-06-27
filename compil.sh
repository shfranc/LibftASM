nasm -f macho64 srcs/hello_world.s -o hello.o
gcc hello.o main.c
