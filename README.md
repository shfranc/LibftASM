# LIBFTS.A

Learning assembly by writing a small library of libC functions.

Setup: X86, Intel syntax, with nasm.

## Usage

### Requirements:
- nasm: `brew install nasm`

### Compilation
```bash
make			# compile the library
make test		# compile and execute some C unit tests
```

## Functions

### Part1
- bzero
- strcat
- isalpha
- isdigit
- isalnum
- isascii
- isprint
- toupper
- tolower
- puts

### Part2
- strlen
- memset
- memcpy
- strdup

### Part3
- ft_cat: a function that act like the `cat` binary
```bash
make cat_test	# compile and execute some bash unit tests for ft_cat
```

## Bonus
- memalloc
- strnew
- strcpy
- strcmp
- strchr
- strjoin
- atoi
