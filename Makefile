# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eassouli <eassouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/19 17:04:09 by eassouli          #+#    #+#              #
#    Updated: 2021/01/19 18:11:00 by eassouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

MKDIR	=	/bin/mkdir -p

PATH_B	=	build/

NASM	=	/usr/bin/nasm

FLAGS	=	-felf64

SRCS	=	ft_strlen.s

PATH_S	=	srcs/

OBJS_B	=	$(addprefix $(PATH_B), $(SRCS:.s=.o))

AR	=	/usr/bin/ar rc

RM	=	/bin/rm -rf

all:	$(PATH_B) $(NAME)

$(NAME):	$(OBJS_B)
	$(AR) $(NAME) $(OBJS_B)

$(PATH_B)%.o:	$(PATH_S)%.s
	$(NASM) $(FLAGS) -o $@ -s $<

$(PATH_B):
	$(MKDIR) $(PATH_B)

clean:
	$(RM) $(PATH_B)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re bonus