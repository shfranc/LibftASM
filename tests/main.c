#include <stdio.h>
#include <string.h>

void	ft_bzero(void *s, size_t size);
char 	*ft_strcat(char *restrict s1, const char *restrict s2);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_puts(const char *s);

char	*put_boolean(int b)
{
	return (b == 0 ? "true" : "false");
}

int		main(void)
{
	printf("\nFT_BZERO\n");
	{
		char s[12] = "test bzero";
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t- len: %lu\n", s, strlen(s));
	}
	{
		char *s = strdup("test bzero");
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t- len: %lu\n", s, strlen(s));
	}
	{
		char *s = strdup("");
		printf("str: %s\t- len: %lu\n", s, strlen(s));
		ft_bzero(s, strlen(s));
		printf("str: %s\t- len: %lu\n", s, strlen(s));
	}
	// {
	// 	char *s = NULL;
	// 	printf("str: %s\t- len: %lu\n", s, strlen(s));
	// 	ft_bzero(s, strlen(s)); // le vai bzero segfault aussi ici
	// 	printf("str: %s\t- len: %lu\n", s, strlen(s));
	// }

	printf("\nFT_STRCAT\n");
	{
		char s2[9] = "*********";
		char s1[20] = "test strcat";
		printf("str1: %s\t- str2: %s\n", s1, s2);
		printf("result: %s\n", ft_strcat(s1, s2));
	}
	// {
	// 	char s2[9] = "*********";
	// 	char s1[11] = "test strcat";
	// 	printf("str1: %s\t- str2: %s\n", s1, s2);
	// 	printf("result: %s\n", ft_strcat(s1, s2));
	// }

	printf("\nFT_ISALPHA\n");
	{
		printf("isalpha: %c-> %s\n", 'a', put_boolean(ft_isalpha('a')));
		printf("isalpha: %c-> %s\n", 'A', put_boolean(ft_isalpha('A')));
		printf("isalpha: %c-> %s\n", 'J', put_boolean(ft_isalpha('J')));
		printf("isalpha: %c-> %s\n", 'j', put_boolean(ft_isalpha('j')));
		printf("isalpha: %c-> %s\n", 'z', put_boolean(ft_isalpha('z')));
		printf("isalpha: %c-> %s\n", 'Z', put_boolean(ft_isalpha('Z')));
		printf("isalpha: %c-> %s\n", '?', put_boolean(ft_isalpha('?')));
		printf("isalpha: %c-> %s\n", '9', put_boolean(ft_isalpha('9')));
	}

	printf("\nFT_ISDIGIT\n");
	{
		printf("isdigit: %c-> %s\n", '0', put_boolean(ft_isdigit('0')));
		printf("isdigit: %c-> %s\n", '5', put_boolean(ft_isdigit('5')));
		printf("isdigit: %c-> %s\n", '9', put_boolean(ft_isdigit('9')));
		printf("isdigit: %c-> %s\n", 'j', put_boolean(ft_isdigit('j')));
		printf("isdigit: %c-> %s\n", 'z', put_boolean(ft_isdigit('z')));
		printf("isdigit: %c-> %s\n", 'Z', put_boolean(ft_isdigit('Z')));
		printf("isdigit: %c-> %s\n", '?', put_boolean(ft_isdigit('?')));
		printf("isdigit: %c-> %s\n", '*', put_boolean(ft_isdigit('*')));
	}

	printf("\nFT_PUTS\n");
	{
		char s[12] = "test puts";
		puts(s);
		ft_puts(s);
	}
	{
		char *s = strdup("test puts");
		puts(s);
		ft_puts(s);
	}
	{
		char *s = strdup("");
		puts(s);
		ft_puts(s);
	}
	return (0);
}
