# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eassouli <eassouli@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/19 17:04:09 by eassouli          #+#    #+#              #
#    Updated: 2021/01/31 23:52:26 by eassouli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

INCLUDE	=	includes/.

MKDIR	=	/bin/mkdir -p

PATH_B	=	build/

NASM	=	/usr/bin/nasm

FLAGS	=	-felf64 -I $(INCLUDE)

SRCS	=	ft_strlen.s\
	ft_strcpy.s\
	ft_strcmp.s\
	ft_write.s\
	ft_read.s\
	ft_strdup.s

PATH_S	=	srcs/

OBJS_B	=	$(addprefix $(PATH_B), $(SRCS:.s=.o))

AR	=	/usr/bin/ar rcs

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