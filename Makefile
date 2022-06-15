SRCS =	ft_printf.c \
			ft_printchar.c \
			ft_printhex.c \
			ft_printstr.c \
			ft_upprinthex.c \
			ft_printun.c \
			ft_printnbr.c

OBJS = $(SRCS:.c=.o)

NAME = libftprintf.a

CFLAGS = -Wall -Werror -Wextra

CC = gcc

TESTFLAGS = -fsanitize=address -g

INC = -I include/

LIBFT = ./libft/libft.a

all: $(LIBFT) $(NAME)($(OBJS))

$(NAME): %.o $(LIBFT)
	ar rs $@ $<

%.o: %.c
	$(CC) $(CFLAGS) $(INC) -c $<

$(LIBFT):
	make -C libft/
	cp $(LIBFT) libftprintf.a

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)
	make -C libft/ fclean

re: fclean all
