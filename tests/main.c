#include <stdio.h>
#include <string.h>

void	ft_bzero(void *s, size_t size);

int		main(void)
{
	fprintf(stdout, "\nFT_BZERO\n");

	char *s = "test bzero\n";
	ft_bzero(s, strlen(s));

	return (0);
}
