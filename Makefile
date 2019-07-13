NAME = libfts.a
FLAGS = -Wall -Wextra -Werror
CC = gcc
NASM = nasm

PATH_SRCS = srcs
SRCS = 	$(addprefix $(PATH_SRCS)/, \
	ft_bzero.s \
	ft_strcat.s \
	ft_isalpha.s \
	ft_isdigit.s \
	ft_isalnum.s \
	ft_isascii.s \
	ft_isprint.s \
	ft_toupper.s \
	ft_tolower.s \
	ft_puts.s \
	ft_memcpy.s \
	ft_memset.s \
	ft_strlen.s \
	ft_memalloc.s \
	ft_strnew.s \
	ft_strcpy.s \
	)

PATH_OBJS = objs
OBJS = $(SRCS:$(PATH_SRCS)/%.s=$(PATH_OBJS)/%.o)

C_TEST = compil_tests
C_MAIN = tests/main.c
C_MAIN_O = tests/main.o

RED = \033[01;31m
GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
RESET = \033[00m

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $@ $^
	@ranlib $@
	@printf "$(GREEN)%s$(RESET): OK\n" "$@"

$(PATH_OBJS)/%.o: $(PATH_SRCS)/%.s
	@mkdir -p $(PATH_OBJS)
	@$(NASM) -f macho64 $< -o $@
	@printf "$(YELLOW)compil:$(RESET) %s\n" "$@"

$(C_TEST): $(NAME) $(C_MAIN)
	@$(CC) $(FLAGS) -c $(C_MAIN) -o $(C_MAIN_O)
	@$(CC) $(FLAGS) $(C_MAIN_O) $(NAME) -o $@
	@printf "$(GREEN)%s$(RESET): OK\n" "$@"

test: $(NAME) $(C_TEST)
	@printf "$(GREEN)*** RUN C TESTS ***$(RESET):\n"
	@./$(C_TEST)

clean:
	@rm -rf $(PATH_OBJS) tests/*.o
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -rf $(NAME) $(C_TEST)
	@echo "$(BLUE)clean:$(RESET) $(NAME)"

re: fclean all

.PHONY: clean fclean re
