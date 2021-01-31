#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "libasm.h"

#define BUFFER_SIZE 8

int	main(void)
{
	char	s1[10] = "test";
	char	s2[10] = "tes";
	char	*ft_dst;
	char	*dst;
	int		ft_fd;
	int		fd;
	char	ft_buff[BUFFER_SIZE + 1];
	char	buff[BUFFER_SIZE + 1];
	char	*ft_dup;
	char	*dup;

	printf("-------- FT_STRLEN --------\n");
	printf("ft_strlen : %zu\n", ft_strlen(s1));
	printf("strlen    : %lu\n\n", strlen(s1));
	printf("-------- FT_STRCPY --------\n");
	ft_dst = malloc(sizeof(char) * ft_strlen(s1) + 1);
	dst = malloc(sizeof(char) * strlen(s1) + 1);
	printf("ft_strcpy return : %s\n", ft_strcpy(ft_dst, s1));
	printf("strcpy    return : %s\n", strcpy(dst, s1));
	printf("ft_strcpy string : %s\n", ft_dst);
	printf("strcpy    string : %s\n\n", dst);
	printf("-------- FT_STRCMP --------\n");
	printf("ft_strcmp OK : %d\n", ft_strcmp(ft_dst, s1));
	printf("strcmp    OK : %d\n\n", strcmp(dst, s1));
	printf("ft_strcmp KO : %d\n", ft_strcmp(ft_dst, s2));
	printf("strcmp    KO : %d\n\n", strcmp(dst, s2));
	printf("-------- FT_WRITE --------\n");
	printf("\nft_write   OK : %zd\n", ft_write(1, ft_dst, ft_strlen(ft_dst)));
	printf("\nwrite      OK : %zd\n\n", write(1, dst, strlen(dst)));
	printf("ft_write   KO : %zd\n", ft_write(1, NULL, ft_strlen(ft_dst)));
	printf("write      KO : %zd\n\n", write(1, NULL, strlen(dst)));
	printf("-------- FT_READ --------\n");
	ft_fd = open("test.txt", O_RDONLY);
	fd = open("test.txt", O_RDONLY);
	printf("ft_read OK : %zd : %s\n", ft_read(ft_fd, ft_buff, BUFFER_SIZE), ft_buff);
	printf("read    OK : %zd : %s\n", read(fd, buff, BUFFER_SIZE), buff);
	printf("ft_read KO : %zd\n", ft_read(ft_fd, NULL, BUFFER_SIZE));
	printf("read    KO : %zd\n\n", read(fd, NULL, BUFFER_SIZE));
	printf("-------- FT_STRDUP --------\n");
	ft_dup = ft_strdup("Lorem ipsum dolor sit amet, consectetur adipiscingelit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquambibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Crasvolutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisifelis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellusac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posueretortor, sit amet consequat amet.");
	dup = strdup("Lorem ipsum dolor sit amet, consectetur adipiscingelit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquambibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Crasvolutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisifelis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellusac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posueretortor, sit amet consequat amet.");
	printf("ft_strdup : %s\n", ft_dup);
	printf("strdup    : %s\n", dup);
	free(ft_dup);
	free(dup);
	free(ft_dst);
	free(dst);
	close(ft_fd);
	close(fd);
	return (0);
}
