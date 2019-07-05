NAME = libftasm.a
FLAGS = -Wall -Wextra -Werror
CC = gcc
NASM = nasm

PATH_SRCS = srcs
SRCS = 	$(addprefix $(PATH_SRCS)/, \
	ft_bzero.s \
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

test: $(C_TEST)
	@printf "$(GREEN)*** RUN C TESTS ***$(RESET):\n"
	@./$(C_TEST)

clean:
	@rm -f $(OBJS) tests/*.o
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -f $(NAME) $(C_TEST)
	@echo "$(BLUE)clean:$(RESET) $(NAME)"

re: fclean all

.PHONY: clean fclean re