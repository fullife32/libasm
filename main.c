#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

# define BUFFER_SIZE 8

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int	ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

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
	return (0);
}