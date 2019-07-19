#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

# define RED		"\033[1;31m"
# define GREEN		"\033[1;32m"
# define YELLOW		"\033[1;33m"
# define BLUE		"\033[1;34m"
# define MAGENTA	"\033[1;35m"
# define CYAN		"\033[1;36m"
# define WHITE		"\033[1;37m"
# define RESET 		"\033[0m"

// PART 1
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
// PART 2
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
void	*ft_memset(void *b, int c, size_t len);
size_t	ft_strlen(const char *s);
char	*ft_strdup(const char *s1);
// BONUS
void	*ft_memalloc(size_t size);
char	*ft_strnew(size_t size);
char	*ft_strcpy(char *dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strjoin(char *s1, char *s2);
int		ft_atoi(char *str);

void	put_title(char *title)
{
	fprintf(stdout, "\n"WHITE"%s"RESET"\n", title);
}

char	*assert_ret(int ret1, int ret2)
{
	if (ret1 == ret2)
		return (GREEN"OK"RESET);
	return (RED"NOPE !"RESET);
}

char	*assert_str(char *str1, char *str2)
{
	if (str1 == NULL && str2 == NULL)
		return (GREEN"OK"RESET);
	if ((str1 == NULL && str2 != NULL)
		|| (str1 != NULL && str2 == NULL))
	{
		return (RED"NOPE !"RESET);
	}
	if (strcmp(str1, str2) == 0)
		return (GREEN"OK"RESET);
	return (RED"NOPE !"RESET);
}

int		main(void)
{
	put_title("BZERO");
	{
		char s[12] = "test bzero";
		fprintf(stdout, "str: %s\t", s);
		ft_bzero(s, strlen(s));
		fprintf(stdout, "\t- result: %lu -> %s\n", strlen(s), assert_ret(strlen(s), 0));
	}
	{
		char *s = strdup("test bzero");
		fprintf(stdout, "str: %s\t", s);
		ft_bzero(s, strlen(s));
		fprintf(stdout, "\t- result: %lu -> %s\n", strlen(s), assert_ret(strlen(s), 0));
		free(s);
	}
	{
		char *s = strdup("");
		fprintf(stdout, "str: %s\t", s);
		ft_bzero(s, strlen(s));
		fprintf(stdout, "\t- result: %lu -> %s\n", strlen(s), assert_ret(strlen(s), 0));
		free(s);
	}
	{
		char *s = strdup("************************");
		fprintf(stdout, "str: %s\t", s);
		ft_bzero(s, strlen(s) - 10);
		fprintf(stdout, "\t- result: %lu -> %s\n", strlen(s), assert_ret(strlen(s), 0));
		free(s);
	}

	put_title("STRCAT");
	{
		char *src = strdup("*********");
		char *dest1 = malloc(20); strcpy(dest1, "test strcat");
		char *dest2 = malloc(20); strcpy(dest2, "test strcat");
		fprintf(stdout, "str1: %s\t- str2: %s\t", dest1, src);
		fprintf(stdout, "result: -> %s\n", assert_str(ft_strcat(dest1, src), strcat(dest2, src)));
		free(dest1); free(dest2); free(src);
	}
	{
		char *src = strdup("*********");
		char *dest1 = malloc(20); strcpy(dest1, "");
		char *dest2 = malloc(20); strcpy(dest2, "");
		fprintf(stdout, "str1: %s\t- str2: %s\t", dest1, src);
		fprintf(stdout, "result: -> %s\n", assert_str(ft_strcat(dest1, src), strcat(dest2, src)));
		free(dest1); free(dest2); free(src);
	}
	{
		char *src = strdup("");
		char *dest1 = malloc(20); strcpy(dest1, "*********");
		char *dest2 = malloc(20); strcpy(dest2, "*********");
		fprintf(stdout, "str1: %s\t- str2: %s\t", dest1, src);
		fprintf(stdout, "result: -> %s\n", assert_str(ft_strcat(dest1, src), strcat(dest2, src)));
		free(dest1); free(dest2); free(src);
	}

	put_title("\tISALPHA\tISDIGIT\tISALNUM\tISASCII\tISPRINT\tTOUPPER\tTOLOWER");
	// {
	// 	int i = -1;
	// 	while (i <= 130)
	// 	{
	// 		fprintf(stdout, "%3d %c \t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", i, isprint(i) ? i : '.',
	// 			assert_ret(ft_isalpha(i), isalpha(i)),
	// 			assert_ret(ft_isdigit(i), isdigit(i)),
	// 			assert_ret(ft_isalnum(i), isalnum(i)),
	// 			assert_ret(ft_isascii(i), isascii(i)),
	// 			assert_ret(ft_isprint(i), isprint(i)),
	// 			assert_ret(ft_toupper(i), toupper(i)),
	// 			assert_ret(ft_tolower(i), tolower(i))
	// 		);
	// 		i++;
	// 	}
	// }

	put_title("PUTS");
	{
		char s[20] = "test puts stack";
		ft_puts(s);
	}
	{
		char *s = strdup("test puts strdup");
		ft_puts(s);
		free(s);
	}
	{
		char *s = strdup("");
		write(1, "empty: ", 7);
		ft_puts(s);
		free(s);
	}
	{
		char *s = NULL;
		write(1, "null: ", 6);
		ft_puts(s);
	}

	put_title("STRLEN");
	{
		char *src = strdup("Hello World!");
		fprintf(stdout, "src: %s = %zu -> %s\n", src, ft_strlen(src), assert_ret(ft_strlen(src), strlen(src)));
		free(src);
	}
	{
		char *src = strdup("A");
		fprintf(stdout, "src: %s = %zu -> %s\n", src, ft_strlen(src), assert_ret(ft_strlen(src), strlen(src)));
		free(src);
	}
	{
		char *src = strdup("");
		fprintf(stdout, "src: %s = %zu -> %s\n", src, ft_strlen(src), assert_ret(ft_strlen(src), strlen(src)));
		free(src);
	}

	put_title("MEMCPY");
	{
		char *dest1 = strdup("                   ");
		char *dest2 = strdup("                   ");
		char *src = strdup("copie cette chaine!");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
		free(dest1); free(dest2); free(src);
	}
	{
		char *dest1 = strdup("*******************");
		char *dest2 = strdup("*******************");
		char *src = strdup("copie cette chaine!");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
		free(dest1); free(dest2); free(src);
	}
	{
		char *dest1 = strdup("*******************");
		char *dest2 = strdup("*******************");
		char *src = strdup("");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_memcpy(dest1, src, ft_strlen(src)), memcpy(dest2, src, ft_strlen(src))));
		free(dest1); free(dest2); free(src);
	}

	put_title("MEMSET");
	{
		char *src1 = strdup("                    ");
		char *src2 = strdup("                    ");
		char c = 'i';
		fprintf(stdout, "src: %s -> %s\n", src1, assert_str(ft_memset(src1, c, strlen(src1)), memset(src2, c, strlen(src2))));
		free(src1); free(src2);
	}
	{
		char *src1 = strdup("********************");
		char *src2 = strdup("********************");
		char c = 0;
		fprintf(stdout, "src: %s -> %s\n", src1, assert_str(ft_memset(src1, c, strlen(src1)), memset(src2, c, strlen(src2))));
		free(src1); free(src2);
	}
	{
		char *src1 = strdup("********************");
		char *src2 = strdup("********************");
		char c = 'o';
		fprintf(stdout, "src: %s -> %s\n", src1, assert_str(ft_memset(src1, c, strlen(src1) / 2), memset(src2, c, strlen(src2) / 2)));
		free(src1); free(src2);
	}

	put_title("MEMALLOC");
	{
		char *s = NULL;
		fprintf(stdout, "before: %s\n", s);
		s = ft_memalloc(20);
		fprintf(stdout, "after: %s\n", s);
	}

	put_title("STRNEW");
	{
		char *s = NULL;
		fprintf(stdout, "before: %s\n", s);
		s = ft_strnew(20);
		fprintf(stdout, "after: %s\n", s);
	}

	put_title("STRCPY");
	{
		char *dest1 = strdup("                   ");
		char *dest2 = strdup("                   ");
		char *src = strdup("copie cette chaine!");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
		free(dest1); free(dest2); free(src);
	}
	{
		char *dest1 = strdup("*******************");
		char *dest2 = strdup("*******************");
		char *src = strdup("copie cette chaine!");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
		free(dest1); free(dest2); free(src);
	}
	{
		char *dest1 = strdup("*******************");
		char *dest2 = strdup("*******************");
		char *src = strdup("");
		fprintf(stdout, "dest: %s src: %s\t", dest1, src);
		fprintf(stdout, " -> %s\n", assert_str(ft_strcpy(dest1, src), strcpy(dest2, src)));
		free(dest1); free(dest2); free(src);
	}

	put_title("STRDUP");
	{
		char src[15] = "Hello World! 1";
		fprintf(stdout, "src: %s -> %s\n", src, assert_str(ft_strdup(src), strdup(src)));
	}
	{
		char *src = strdup("Hello World! 2");
		fprintf(stdout, "src: %s -> %s\n", src, assert_str(ft_strdup(src), strdup(src)));
	}
	{
		char src[15] = "";
		fprintf(stdout, "src: %s -> %s\n", src, assert_str(ft_strdup(src), strdup(src)));
	}
	{
		char *src = strdup("");
		fprintf(stdout, "src: %s -> %s\n", src, assert_str(ft_strdup(src), strdup(src)));
	}

	put_title("STRCMP");
	{
		char *s1 = strdup("lol");
		char *s2 = strdup("lol");
		fprintf(stdout, "s1: %s s2: %s - ft_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), assert_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("lol");
		char *s2 = strdup("lol2");
		fprintf(stdout, "s1: %s s2: %s - ft_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), assert_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("lolilol");
		char *s2 = strdup("");
		fprintf(stdout, "s1: %s s2: %s - ft_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), assert_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("");
		char *s2 = strdup("lolilol");
		fprintf(stdout, "s1: %s s2: %s - ft_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), assert_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("");
		char *s2 = strdup("");
		fprintf(stdout, "s1: %s s2: %s - ft_ret: %d ret: %d -> %s\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2), assert_ret(ft_strcmp(s1, s2), strcmp(s1, s2)));
		free(s1); free(s2);
	}

	put_title("STRJOIN");
	{
		char *s1 = strdup("lol");
		char *s2 = strdup("lol");
		fprintf(stdout, "s1: %s s2: %s -> %s\n", s1, s2, assert_str(ft_strjoin(s1, s2), "lollol"));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("lol");
		char *s2 = strdup("lol2");
		fprintf(stdout, "s1: %s s2: %s -> %s\n", s1, s2, assert_str(ft_strjoin(s1, s2), "lollol2"));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("lolilol");
		char *s2 = strdup("");
		fprintf(stdout, "s1: %s s2: %s -> %s\n", s1, s2, assert_str(ft_strjoin(s1, s2), "lolilol"));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("");
		char *s2 = strdup("lolilol");
		fprintf(stdout, "s1: %s s2: %s -> %s\n", s1, s2, assert_str(ft_strjoin(s1, s2), "lolilol"));
		free(s1); free(s2);
	}
	{
		char *s1 = strdup("");
		char *s2 = strdup("");
		fprintf(stdout, "s1: %s s2: %s -> %s\n", s1, s2, assert_str(ft_strjoin(s1, s2), ""));
		free(s1); free(s2);
	}

	put_title("ATOI");
	{
		char *str = strdup("1");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("-42");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("   123");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("	-123");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("0");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("2147483647");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("-2147483648");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("214748364700");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("-214748364800");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("123abc");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("+42");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("++++42");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("qwert");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", str, ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("           ");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", "(only spaces)", ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	{
		char *str = strdup("");
		fprintf(stdout, "str: %-25s ft_ret: %12d - ret: %12d -> %s\n", "(vide)", ft_atoi(str), atoi(str), assert_ret(ft_atoi(str), atoi(str)));
		free(str);
	}
	return (0);
}
