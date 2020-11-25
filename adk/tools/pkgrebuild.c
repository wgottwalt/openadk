/*
 * pkgrebuild - recognize required package rebuilds in OpenADK
 *
 * Copyright (C) 2010,2011 Waldemar Brodkorb <wbx@openadk.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <ctype.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "strmap.h"

#define D_PKG_		"ADK_PACKAGE_"
#define D_		"_"

StrMap *configmap, *configoldmap, *pkgmap;

/*
static void iter(const char *key, const char *value, const void *obj) {
	fprintf(stderr, "key: %s value: %s\n", key, value);
}
*/

static void iter_disabled(const char *key, const char *value, const void *obj) {

	char hvalue[256];
	char tfile[256];
	int fd;

	memset(hvalue, 0, 256);
	if (strmap_exists(configmap, key) == 0) {
		//fprintf(stderr, "disabled variables: %s\n", key);
		if (strmap_get(pkgmap, key, hvalue, sizeof(hvalue)) == 1) {
			//fprintf(stderr, "Symbol is a flavour/choice: %s\n", hvalue);
			if (snprintf(tfile, 256, ".rebuild.%s", hvalue) < 0)
				perror("can not create file variable.");
			fd = open(tfile, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
			close(fd);
		}
	}

}

static void iter_enabled(const char *key, const char *value, const void *obj) {

	char hvalue[256];
	char tfile[256];
	int fd;

	memset(hvalue, 0, 256);
	if (strmap_exists(configoldmap, key) == 0) {
		//fprintf(stderr, "enabled variables: %s\n", key);
		if (strmap_get(pkgmap, key, hvalue, sizeof(hvalue)) == 1) {
			//fprintf(stderr, "Symbol is a flavour/choice\n");
			if (snprintf(tfile, 256, ".rebuild.%s", hvalue) < 0)
				perror("can not create file variable.");
			fd = open(tfile, O_RDWR | O_CREAT, S_IRUSR | S_IWUSR);
			close(fd);
		}
	}
}

static char *toupperstr(char *string) {

	int i;
	char *str;

	/* transform to uppercase variable name */
	str = strdup(string);
	for (i=0; i<(int)strlen(str); i++) {
		if (str[i] == '+')
			str[i] = 'X';
		if (str[i] == '-')
			str[i] = '_';
		str[i] = toupper(str[i]);
	}
	return(str);
}



int main() {

	FILE *config, *configold, *pkg;
	char *key, *value, *string, *token, *check;
	char *pkg_name, *keystr, *realpkgname;
	char buf[128];
	char path[320];
	char pbuf[320];
	DIR *pkgdir;
	struct dirent *pkgdirp;

	pkg_name = NULL;
	/* read Makefile's for all packages */
	pkgmap = strmap_new(1024);
	pkgdir = opendir("package");
	while ((pkgdirp = readdir(pkgdir)) != NULL) {
		/* skip dotfiles */
		if (strncmp(pkgdirp->d_name, ".", 1) > 0) {
			if (snprintf(path, 320, "package/%s/Makefile", pkgdirp->d_name) < 0)
				perror("can not create path variable.");
			pkg = fopen(path, "r");
			if (pkg == NULL)
				continue;

			while (fgets(pbuf, 320, pkg) != NULL) {
				if (strncmp(pbuf, "PKG", 3) == 0) {
					string = strstr(pbuf, "PKG_NAME:=");
					if (string != NULL) {
						string[strlen(string)-1] = '\0';
						key = strtok(string, ":=");
						value = strtok(NULL, "=\t");
						if (value != NULL)
							pkg_name = strdup(value);
					}
					string = strstr(pbuf, "PKG_SUBPKGS:=");
					if (string != NULL) {
						string[strlen(string)-1] = '\0';
						key = strtok(string, ":=");
						value = strtok(NULL, "=\t");
						token = strtok(value, " ");
						while (token != NULL) {
							keystr = malloc(256);
							memset(keystr, 0, 256);
							strncat(keystr, D_PKG_, sizeof(D_PKG_));
							strncat(keystr, token, strlen(token));
							strmap_put(pkgmap, keystr, pkgdirp->d_name);
							token = strtok(NULL, " ");
							free(keystr);
							keystr = NULL;
						}
					}
					string = strstr(pbuf, "PKG_SUBPKGS+=");
					if (string != NULL) {
						string[strlen(string)-1] = '\0';
						key = strtok(string, "+=");
						value = strtok(NULL, "=\t");
						token = strtok(value, " ");
						while (token != NULL) {
							keystr = malloc(256);
							memset(keystr, 0, 256);
							strncat(keystr, D_PKG_, sizeof(D_PKG_));
							strncat(keystr, token, strlen(token));
							strmap_put(pkgmap, keystr, pkgdirp->d_name);
							token = strtok(NULL, " ");
							free(keystr);
							keystr = NULL;
						}
					}
					string = strstr(pbuf, "PKG_FLAVOURS_");
					if (string != NULL) {
						check = strstr(pbuf, ":=");
						if (check != NULL) {
							string[strlen(string)-1] = '\0';
							key = strtok(string, ":=");
							realpkgname = strdup(key+13);
							value = strtok(NULL, "=\t");
							token = strtok(value, " ");
							while (token != NULL) {
								keystr = malloc(256);
								memset(keystr, 0, 256);
								strncat(keystr, D_PKG_, sizeof(D_PKG_));
								strncat(keystr, realpkgname, strlen(realpkgname));
								strncat(keystr, D_, sizeof(D_));
								strncat(keystr, token, strlen(token));
								strmap_put(pkgmap, keystr, pkgdirp->d_name);
								token = strtok(NULL, " ");
								free(keystr);
								keystr = NULL;
							}
						} else {
							string[strlen(string)-1] = '\0';
							key = strtok(string, "+=");
							realpkgname = strdup(key+13);
							value = strtok(NULL, "=\t");
							token = strtok(value, " ");
							while (token != NULL) {
								keystr = malloc(256);
								memset(keystr, 0, 256);
								strncat(keystr, D_PKG_, sizeof(D_PKG_));
								strncat(keystr, realpkgname, strlen(realpkgname));
								strncat(keystr, D_, sizeof(D_));
								strncat(keystr, token, strlen(token));
								strmap_put(pkgmap, keystr, pkgdirp->d_name);
								token = strtok(NULL, " ");
								free(keystr);
								keystr = NULL;
							}
						}
					}
					string = strstr(pbuf, "PKG_CHOICES_");
					if (string != NULL) {
						string[strlen(string)-1] = '\0';
						key = strtok(string, ":=");
						value = strtok(NULL, "=\t");
						token = strtok(value, " ");
						while (token != NULL) {
							keystr = malloc(256);
							memset(keystr, 0, 256);
							strncat(keystr, D_PKG_, sizeof(D_PKG_));
							strncat(keystr, toupperstr(pkg_name), strlen(pkg_name));
							strncat(keystr, D_, sizeof(D_));
							strncat(keystr, token, strlen(token));
							strmap_put(pkgmap, keystr, pkgdirp->d_name);
							token = strtok(NULL, " ");
							free(keystr);
							keystr = NULL;
						}
					}
				}
			}
			fclose(pkg);
		}
	}
	closedir(pkgdir);

	config = fopen(".config", "r");
	if (config == NULL) {
		perror(".config is missing.");
		exit(1);
	}

	configmap = strmap_new(1024);
	while (fgets(buf, 128, config) != NULL) {
		if (strncmp(buf, "ADK_PACKAGE", 11) == 0) {
			key = strtok(buf, "=");
			value = strtok(NULL, "=");
			strmap_put(configmap, key, value);
		}
	}
	fclose(config);

	configold = fopen(".config.old", "r");
	if (configold == NULL) {
		perror(".config.old is missing.");
		exit(1);
	}

	configoldmap = strmap_new(1024);
	while (fgets(buf, 128, configold) != NULL) {
		if (strncmp(buf, "ADK_PACKAGE", 11) == 0) {
			key = strtok(buf, "=");
			value = strtok(NULL, "=");
			strmap_put(configoldmap, key, value);
		}
	}
	fclose(configold);

	//fprintf(stdout, "Config Count: %d\n", strmap_get_count(configmap));
	//fprintf(stdout, "Config Old Count: %d\n", strmap_get_count(configoldmap));

	strmap_enum(configoldmap, iter_disabled, NULL);
	strmap_enum(configmap, iter_enabled, NULL);
	//strmap_enum(pkgmap, iter, NULL);

	strmap_delete(pkgmap);
	strmap_delete(configmap);
	strmap_delete(configoldmap);

	return(0);
}
