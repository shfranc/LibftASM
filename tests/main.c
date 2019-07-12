#include <stdio.h>
#include <string.h>

void	ft_bzero(void *s, size_t size);
char 	*ft_strcat(char *restrict s1, const char *restrict s2);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
void	*ft_memset(void *b, int c, size_t len);
size_t	ft_strlen(const char *s);

char	*put_boolean(int b)
{
	return (b == 1 ? "true" : "false");
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

	printf("\nFT_STRCAT\n");
	{
		char s2[9] = "*********";
		char s1[20] = "test strcat";
		printf("str1: %s\t- str2: %s\n", s1, s2);
		printf("result: %s\n", ft_strcat(s1, s2));
	}

	printf("\n\tISALPHA\tISDIGIT\tISALNUM\tISASCII\tISPRINT\n");
	{
		int i = -1;
		while (i <= 130)
		{
			printf("%3d %c \t%s\t%s\t%s\t%s\t%s\n", i, i,
				put_boolean(ft_isalpha(i)),
				put_boolean(ft_isdigit(i)),
				put_boolean(ft_isalnum(i)),
				put_boolean(ft_isascii(i)),
				put_boolean(ft_isprint(i))
			);
			i++;
		}
	}

	printf("\n\tTOUPPER\tTOLOWER\n");
	{
		int i = 32;
		while (i <= 126)
		{
			printf("%c:\t%c\t%c\n", i, ft_toupper(i), ft_tolower(i));
			i++;
		}
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
	{
		char *s = NULL;
		puts(s);
		ft_puts(s);
	}
	printf("\nFT_MEMCPY\n");
	{
		char dest[20];
		char source[20] = "copie cette chaine!";
		ft_memcpy(dest, source, 20);
		printf("dest: %s\n", dest);
	}
	{
		char dest[20] = "*******************";
		char source[20] = "copie cette chaine!";
		ft_memcpy(dest, source, 20);
		printf("dest: %s\n", dest);
	}
	{
		char *dest = strdup("*******************");
		char *source = strdup("");
		ft_memcpy(dest, source, 0);
		printf("dest: %s\n", dest);
	}
	printf("\nFT_MEMSET\n");
	{
		char *src = strdup("                    ");
		char c = 'i';
		ft_memset(src, c, strlen(src));
		printf("src: %s\n", src);
	}
	{
		char *src = strdup("********************");
		char c = 0;
		ft_memset(src, c, strlen(src));
		printf("src: %s\n", src);
	}
	{
		char *src = strdup("********************");
		char c = 'o';
		ft_memset(src, c, strlen(src) / 2);
		printf("src: %s\n", src);
	}
	printf("\nFT_STRLEN\n");
	{
		char *src = strdup("Hello World!");
		printf("%s: %zu\n", src, ft_strlen(src));
	}
	{
		char *src = strdup("");
		printf("%s: %zu\n", src, ft_strlen(src));
	}
	{
		printf("%s: %zu\n", "(null)", ft_strlen(NULL));
	}
	return (0);
}
