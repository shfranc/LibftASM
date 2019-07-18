#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// PART 3
void	ft_cat(int fd);

int		main(int argc, char **argv)
{
	if (argc <= 1)
		return (1);
	if (strcmp(argv[1], "STDIN") == 0)
		ft_cat(0);
	else
	{
		int fd = open(argv[1], O_RDONLY, 0);
		if (fd == -1)
			exit(1);
		ft_cat(fd);
		close(fd);
	}
	return (0);
}
