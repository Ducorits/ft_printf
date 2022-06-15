/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_printstr.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: dritsema <dritsema@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/11/06 15:45:58 by dritsema      #+#    #+#                 */
/*   Updated: 2022/06/15 16:50:18 by dritsema      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <unistd.h>

int	ft_printstr(char *s)
{
	int	slen;

	if (!s)
		return (write(1, "(null)", 6));
	slen = ft_strlen(s);
	return (write(1, s, slen));
}
