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
	ft_strdup.s \
	ft_strcmp.s \
	ft_cat.s \
	)

PATH_OBJS = objs
OBJS = $(SRCS:$(PATH_SRCS)/%.s=$(PATH_OBJS)/%.o)

LIB_MAIN = tests/lib_main.c
LIB_MAIN_O = tests/lib_main.o
LIB_TEST = tests/lib_tests

CAT_MAIN = tests/cat_main.c
CAT_MAIN_O = tests/cat_main.o
CAT_TEST = tests/cat_tests
CAT_TEST_SH = tests/cat_tests.sh

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
	@printf "$(YELLOW)compil$(RESET): %s\n" "$@"

$(LIB_TEST): $(NAME) $(LIB_MAIN)
	@$(CC) $(FLAGS) -c $(LIB_MAIN) -o $(LIB_MAIN_O)
	@$(CC) $(FLAGS) $(LIB_MAIN_O) $(NAME) -o $@
	@printf "$(GREEN)%s$(RESET): OK\n" "$@"

$(CAT_TEST): $(NAME) $(CAT_MAIN)
	@$(CC) $(FLAGS) -c $(CAT_MAIN) -o $(CAT_MAIN_O)
	@$(CC) $(FLAGS) $(CAT_MAIN_O) $(NAME) -o $@
	@printf "$(GREEN)%s$(RESET): OK\n" "$@"

test: $(NAME) $(LIB_TEST)
	@printf "$(YELLOW)*** RUN LIB TESTS ***$(RESET):\n"
	@./$(LIB_TEST)

cat_test: $(NAME) $(CAT_TEST)
	@printf "$(YELLOW)*** RUN CAT TESTS ***$(RESET):\n"
	@./$(CAT_TEST_SH)

clean:
	@rm -rf $(PATH_OBJS) $(LIB_MAIN_O) $(CAT_MAIN_O)
	@echo "$(BLUE)clean$(RESET): $(PATH_OBJS) $(LIB_MAIN_O) $(CAT_MAIN_O)"

fclean: clean
	@rm -rf $(NAME) $(LIB_TEST) $(CAT_TEST)
	@echo "$(BLUE)clean$(RESET): $(NAME) $(LIB_TEST) $(CAT_TEST)"

re: fclean all

.PHONY: clean fclean re
