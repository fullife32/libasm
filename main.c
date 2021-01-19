#include <stdio.h>
ssize_t	ft_strlen(const char *s);

int	main(void)
{
	printf("%zd\n", ft_strlen("test"));
	return (0);
}