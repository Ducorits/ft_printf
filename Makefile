CC = gcc

ifdef $(TESTFLAGS)
CFLAGS = -Wall -Werror -Wextra -fsanitize=address -g
else
CFLAGS = -Wall -Werror -Wextra
endif

SRCS =		ft_printf.c \
			ft_printchar.c \
			ft_printhex.c \
			ft_printstr.c \
			ft_upprinthex.c \
			ft_printun.c \
			ft_printnbr.c

OBJS = $(SRCS:%.c=obj/%.o)

NAME = libftprintf.a

INC = -I include/

all: $(NAME)

$(NAME): $(OBJS)
	ar rs $@ $<

obj/%.o: src/%.c
	@mkdir -p obj
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	rm -rf obj/

fclean: clean
	rm -rf $(NAME)

re: fclean all
