#include <stdio.h>
#include <string.h>

void	ft_bzero(void *s, size_t size);

int		main(void)
{
	printf("\nFT_BZERO\n");
	{
		char s[12] = "test bzero";
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t-  len: %lu\n", s, strlen(s));
	}
	{
		char *s = strdup("test bzero");
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t-  len: %lu\n", s, strlen(s));
	}
	{
		char *s = strdup("");
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t-  len: %lu\n", s, strlen(s));
	}
	{
		char *s = NULL;
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s)); // le vai bzero segfault aussi, on ne protège pas alors.
		printf("str: %s\t-  len: %lu\n", s, strlen(s));
	}
	return (0);
}
