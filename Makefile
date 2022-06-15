SRCS =		ft_printf.c \
			ft_printchar.c \
			ft_printhex.c \
			ft_printstr.c \
			ft_upprinthex.c \
			ft_printun.c \
			ft_printnbr.c

OBJS = $(SRCS:%.c=obj/%.o)

NAME = libftprintf.a

CFLAGS = -Wall -Werror -Wextra

CC = gcc

TESTFLAGS = -fsanitize=address -g

INC = -I include/

LIBFT = ./libft/libft.a

all: $(LIBFT) $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	ar rs $@ $<

obj/%.o: src/%.c
	@mkdir -p obj
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(LIBFT):
	make -C libft/
	cp $(LIBFT) libftprintf.a

clean:
	rm -rf obj/

fclean: clean
	rm -rf $(NAME)
	make -C libft/ fclean

re: fclean all
