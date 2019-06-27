NAME = a.out

PATH_SRCS = srcs
SRCS = 	$(addprefix $(PATH_SRCS)/, hello_world.s )
PATH_OBJS = objs
OBJS = $(SRCS:$(PATH_SRCS)/%.s=$(PATH_OBJS)/%.o)

GREEN = \033[01;32m
YELLOW = \033[01;33m
BLUE = \033[01;34m
CYAN = \033[01;36m
RESET = \033[00m

all: $(NAME)

$(NAME): $(OBJS)
	@ld $(OBJS) -macosx_version_min 10.8 -lSystem -o $@
	@printf "$(GREEN)%s$(RESET): OK\n" "$@"

$(PATH_OBJS)/%.o: $(PATH_SRCS)/%.s
	@mkdir -p $(PATH_OBJS)
	@nasm -f macho64 $< -o $@
	@printf "$(YELLOW)compil:$(RESET) %s\n" "$@"

clean:
	@rm -f $(OBJS)
	@echo "$(BLUE)clean:$(RESET) $(PATH_OBJS)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(BLUE)clean:$(RESET) $(NAME)"

re: fclean all

.PHONY: clean fclean re
