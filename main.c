#include <string.h>
#include <stdio.h>
#include <stdlib.h>
size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int	ft_strcmp(const char *s1, const char *s2);

int	main(void)
{
	char	s1[10] = "test";
	char	s2[10] = "tes";
	char	*ft_dst;
	char	*dst;

	printf("ft_strlen : %zu\n", ft_strlen(s1));
	printf("strlen    : %lu\n\n", strlen(s1));
	ft_dst = malloc(sizeof(char) * ft_strlen(s1) + 1);
	dst = malloc(sizeof(char) * strlen(s1) + 1);
	printf("ft_strcpy : %s\n", ft_strcpy(ft_dst, s1));
	printf("strcpy    : %s\n\n", strcpy(dst, s1));
	printf("ft_strcmp OK : %d\n", ft_strcmp(ft_dst, s1));
	printf("strcmp    OK : %d\n\n", strcmp(dst, s1));
	printf("ft_strcmp KO : %d\n", ft_strcmp(ft_dst, s2));
	printf("strcmp    KO : %d\n\n", strcmp(dst, s2));
	
	return (0);
}