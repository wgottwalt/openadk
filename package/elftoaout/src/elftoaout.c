/* $Id: elftoaout.c,v 1.1.1.1 1998/03/02 16:30:10 jj Exp $
 * elftoaout.c: ELF to a.out convertor for SPARC and SPARC64 bootstraps
 *
 * Copyright (C) 1995,1996 Pete A. Zaitcev (zaitcev@vger.rutgers.edu)
 * Copyright (C) 1997 Jakub Jelinek (jj@ultra.linux.cz)
 *
 *  This program is free software; you can redistribute it and/or modify it
 *  under the terms of the GNU General Public License as published by the
 *  Free Software Foundation; either version 2 of the License, or (at your
 *  option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software Foundation,
 *  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
#include <stdio.h>
#include <stdlib.h>
#ifdef linux
#include <linux/elf.h>
#define ELFDATA2MSB   2
#else
#include <sys/elf.h>
#endif

#define swab16(x)  (((x)<<8&0xFF00)|((x)>>8&0x00FF))
#define swab32(x)  (((x)<<24&0xFF000000)|((x)<<8&0x00FF0000)|((x)>>24&0x000000FF)|((x)>>8&0x0000FF00))
#define swab64(x)  ((((unsigned long long)(swab32((unsigned int)x))) << 32) | (swab32(((unsigned long long)x)>>32)))

/* We carry a.out header here in order to compile the thing on Solaris */

#define	AMAGIC	    0x01030107
#define	CMAGIC	    0x01030108

typedef struct {
	unsigned long	a_magic;	/* magic number */
	unsigned long	a_text;		/* size of text segment */
	unsigned long	a_data;		/* size of initialized data */
	unsigned long	a_bss;		/* size of uninitialized data */
	unsigned long	a_syms;		/* size of symbol table || checksum */
	unsigned long	a_entry;	/* entry point */
	unsigned long	a_trsize;	/* size of text relocation */
	unsigned long	a_drsize;	/* size of data relocation */
} Exec;


typedef struct {
	const char *iname;
	const char *oname;
	int sun4_mode;
	int version;
	int swab;
	int sparc64;
	int csum;
	/* friend void Usage(void); */
} Application;

typedef struct {
	Elf32_Phdr *tab;
	unsigned len;
} ProgTable;

typedef struct {
	Elf64_Phdr *tab;
	unsigned len;
} ProgTable64;

void get_ptab(ProgTable *t, FILE *inp, const Elf32_Ehdr *h);
void get_ptab64(ProgTable64 *t, FILE *inp, const Elf64_Ehdr *h);
void print_ptab(ProgTable *t);
void print_ptab64(ProgTable64 *t);

typedef struct {
	char *buf;                /* Image data */
	unsigned len;             /* Length of buffer */
	unsigned bss;             /* Length of extra data */
} Segment;

void load_image(Segment *t, const ProgTable *h, FILE *inp);
void load_image64(Segment *t, const ProgTable64 *h, FILE *inp);
void store_image(Segment *t, FILE *out);

Application prog;

void parse_args(Application *t, unsigned argc, const char **argv);
void get_header(Elf32_Ehdr *t, FILE *inp);
void Usage(void);
void Version(void);
int ipchksum(unsigned char *data, int leng);

int main(int argc, const char **argv)
{
	FILE *inp = stdin;
	FILE *out;
	union {
		Elf32_Ehdr h32;
		Elf64_Ehdr h64;
	} hdrb;
	ProgTable pt;
	Segment image;

	parse_args(&prog, argc, argv);

	if (prog.version) Version();

	if (freopen(prog.iname, "r", stdin) == NULL) {
		fprintf(stderr, "Cannot open \"%s\"\n", prog.iname);
		exit(1);
	}

	if ((out = fopen(prog.oname, "w")) == NULL) {
		fprintf(stderr, "Cannot open \"%s\"\n", prog.oname);
		exit(1);
	}

	get_header(&hdrb.h32, inp);
	/* Now can use longer fields */

	if (hdrb.h32.e_type != ET_EXEC) {
		fprintf(stderr, "Wrong ELF file type\n");
		exit(1);
	}

	if (prog.sparc64) {
		get_ptab64((ProgTable64 *)&pt, inp, &hdrb.h64);
		print_ptab64((ProgTable64 *)&pt);
		load_image64(&image, (ProgTable64 *)&pt, inp);
	} else { 
		get_ptab(&pt, inp, &hdrb.h32);
		print_ptab(&pt);
		load_image(&image, &pt, inp);
	}

	store_image(&image, out);

	fclose(out);
	exit(0);
}

void parse_args( Application *t, unsigned argc, const char **argv ){
	const char *arg;
	union {
		char c[4];
		int i;
	} bord;

	--argc;  argv++;

	/* construct invariant */
	t->sparc64 = 0;
	t->iname = 0;
	t->oname = 0;
	t->sun4_mode = 0;
	t->version = 0;
	t->csum = 0;
	bord.i = 1;
	t->swab = (bord.c[0] == 1);
	/* adjust */
	while ((arg = *argv++) != 0) {
		if (arg[0] == '-') {
			if (arg[1] == 'o') {
				if ((arg = *argv++) == 0) Usage();
				if (t->oname != 0) Usage();
				t->oname = arg;
			} else if (arg[1] == 'b') {
				t->sun4_mode = 1;
			} else if (arg[1] == 'c') {
				t->csum = 1;
			} else if (arg[1] == 'V') {
				t->version = 1;
			} else {
				Usage();
			}
		} else {
			if (t->iname != 0) Usage();
			t->iname = arg;
		}
	}
	if (t->iname == 0) Usage();      /* We do not read from the stdin */
	if (t->oname == 0) t->oname = "a.out";
	if (t->csum && t->sun4_mode) Usage ();	/* Checksum lives in header. */
}

void get_header(Elf32_Ehdr *t, FILE *inp) {

        if (fread((void*) t, sizeof(Elf64_Ehdr), 1, inp) != 1) {
		fprintf(stderr, "Read error on header\n");
		exit(1);
	}

	if (t->e_ident[EI_MAG0] != ELFMAG0 ||
		t->e_ident[EI_MAG1] != ELFMAG1 ||
		t->e_ident[EI_MAG2] != ELFMAG2 ||
		t->e_ident[EI_MAG3] != ELFMAG3)
	{
		fprintf(stderr, "Not an ELF file\n");
		exit(1);
	}

	if (t->e_ident[EI_CLASS] != ELFCLASS32) {
		if (t->e_ident[EI_CLASS] != ELFCLASS64) {
			fprintf(stderr, "Neither 32bit nor 64bit ELF\n");
			exit(1);
		} else {
			prog.sparc64 = 1;
		}
	}

	if (t->e_ident[EI_DATA] != ELFDATA2MSB) {
		fprintf(stderr, "Not an MSB ELF\n");
		exit(1);
	}
	/* There is no need for the run-time check actualy. XXX */
	if (prog.swab) {
		if (!prog.sparc64) {
			t->e_type = swab16(t->e_type);
			t->e_machine = swab16(t->e_machine);
			t->e_version = swab32(t->e_version);
			t->e_entry = swab32(t->e_entry);
			t->e_phoff = swab32(t->e_phoff);
			t->e_shoff = swab32(t->e_shoff);
			t->e_flags = swab32(t->e_flags);
			t->e_ehsize = swab16(t->e_ehsize);
			t->e_phentsize = swab16(t->e_phentsize);
			t->e_phnum = swab16(t->e_phnum);
			t->e_shentsize = swab16(t->e_shentsize);
			t->e_shnum = swab16(t->e_shnum);
			t->e_shstrndx = swab16(t->e_shstrndx);
		} else {
			Elf64_Ehdr *u = (Elf64_Ehdr *)t;
			u->e_type = swab16(u->e_type);
			u->e_machine = swab16(u->e_machine);
			u->e_version = swab32(u->e_version);
			u->e_entry = swab64(u->e_entry);
			u->e_phoff = swab64(u->e_phoff);
			u->e_shoff = swab64(u->e_shoff);
			u->e_flags = swab32(u->e_flags);
			u->e_ehsize = swab16(u->e_ehsize);
			u->e_phentsize = swab16(u->e_phentsize);
			u->e_phnum = swab16(u->e_phnum);
			u->e_shentsize = swab16(u->e_shentsize);
			u->e_shnum = swab16(u->e_shnum);
			u->e_shstrndx = swab16(u->e_shstrndx);
		}
	}
}

void get_ptab(ProgTable *t, FILE *inp, const Elf32_Ehdr *h) {
	unsigned x;

	/** fprintf(stderr, "Program header table off = 0x%x\n",
		(unsigned) h->e_phoff); **/
	if (h->e_phoff == 0) {
		fprintf(stderr, "No Program Header Table\n");
		exit(1);
	}

	/**
	fprintf(stderr, "Program header table entry size = 0x%x\n", (unsigned) h->e_phentsize);
	fprintf(stderr, "Program header table entries total = 0x%x\n", (unsigned) h->e_phnum);
	**/

	t->len = h->e_phnum;
	t->tab = malloc(sizeof(Elf32_Phdr) * t->len);
	if (t->tab == 0) {
		fprintf(stderr, "No core for program table\n");
		exit(1);
	}

	for (x = 0; x < t->len; x++) {
		Elf32_Phdr *p = &t->tab[ x ];
		if (fseek(inp, (long) (h->e_phoff + h->e_phentsize*x), SEEK_SET) == -1) {
			fprintf(stderr, "Seek error on program table\n");
			exit(1);
		}
		if (fread((char *)p, sizeof(Elf32_Phdr), 1, inp) != 1) {
			fprintf(stderr, "Read error on program table\n");
			exit(1);
		}
		if (prog.swab) {
			p->p_type = swab32(p->p_type);
			p->p_offset = swab32(p->p_offset);
			p->p_vaddr = swab32(p->p_vaddr);
			p->p_paddr = swab32(p->p_paddr);
			p->p_filesz = swab32(p->p_filesz);
			p->p_memsz = swab32(p->p_memsz);
			p->p_flags = swab32(p->p_flags);
			p->p_align = swab32(p->p_align);
		}
	}
}

void get_ptab64(ProgTable64 *t, FILE *inp, const Elf64_Ehdr *h) {
	unsigned x;

	if (h->e_phoff == 0) {
		fprintf(stderr, "No Program Header Table\n");
		exit(1);
	}

	t->len = h->e_phnum;
	t->tab = malloc(sizeof(Elf64_Phdr) * t->len);
	if (t->tab == 0) {
		fprintf(stderr, "No core for program table\n");
		exit(1);
	}

	for (x = 0; x < t->len; x++) {
		Elf64_Phdr *p = &t->tab[ x ];
		if (fseek(inp, (long) (h->e_phoff + h->e_phentsize*x), SEEK_SET) == -1) {
			fprintf(stderr, "Seek error on program table\n");
			exit(1);
		}
		if (fread((char *)p, sizeof(Elf64_Phdr), 1, inp) != 1) {
			fprintf(stderr, "Read error on program table\n");
			exit(1);
		}
		if (prog.swab) {
			p->p_type = swab32(p->p_type);
			p->p_offset = swab64(p->p_offset);
			p->p_vaddr = swab64(p->p_vaddr);
			p->p_paddr = swab64(p->p_paddr);
			p->p_filesz = swab64(p->p_filesz);
			p->p_memsz = swab64(p->p_memsz);
			p->p_flags = swab32(p->p_flags);
			p->p_align = swab64(p->p_align);
		}
	}
}

void print_ptab(ProgTable *t) {
	unsigned x;
	const Elf32_Phdr *p;

	for (x = 0; x < t->len; x++) {
		p = &t->tab[ x ];
		printf("PT %d Entry: ", x);
		switch (p->p_type) {
		case PT_NULL:
			printf("NULL");
			break;
		case PT_LOAD:
			printf("Loadable to 0x%x[0x%x] from 0x%x[0x%x] align 0x%x",
				p->p_vaddr, p->p_memsz, p->p_offset, p->p_filesz,
				p->p_align);
			break;
		case PT_DYNAMIC:
			printf("Dynamic");
			break;
		case PT_INTERP:
			printf("Interpreter");
			break;
		case PT_NOTE:
			printf("Note");
			break;
		case PT_SHLIB:
			printf("SHLIB");
			break;
		case PT_PHDR:
			printf("Header Locator");
			break;
		default:
			if( p->p_type >= PT_LOPROC && p->p_type <= PT_HIPROC ){
				printf("CPU specific");
			} else {
				printf("unknown");
			}
		}
		printf("\n");
	}
}

void print_ptab64(ProgTable64 *t) {
	unsigned x;
	const Elf64_Phdr *p;

	for (x = 0; x < t->len; x++) {
		p = &t->tab[ x ];
		printf("PT %d Entry: ", x);
		switch (p->p_type) {
		case PT_NULL:
			printf("NULL");
			break;
		case PT_LOAD:
			printf("Loadable to 0x%Lx[0x%Lx] from 0x%Lx[0x%Lx] align 0x%Lx",
				p->p_vaddr, p->p_memsz, p->p_offset, p->p_filesz,
				p->p_align);
			break;
		case PT_DYNAMIC:
			printf("Dynamic");
			break;
		case PT_INTERP:
			printf("Interpreter");
			break;
		case PT_NOTE:
			printf("Note");
			break;
		case PT_SHLIB:
			printf("SHLIB");
			break;
		case PT_PHDR:
			printf("Header Locator");
			break;
		default:
			if( p->p_type >= PT_LOPROC && p->p_type <= PT_HIPROC ){
				printf("CPU specific");
			} else {
				printf("unknown");
			}
		}
		printf("\n");
	}
}

void load_image(Segment *t, const ProgTable *tp, FILE *inp) {
	Elf32_Phdr *p, *q;
	unsigned x;
	unsigned long off, len;

	p = 0;
	for (x = 0; x < tp->len; x++) {
		if (tp->tab[x].p_type == PT_LOAD) {
			if (p != 0) {
				q = &tp->tab[x];
				off = (q->p_offset - p->p_offset);
				if (q->p_vaddr - p->p_vaddr == off &&
				    q->p_paddr - p->p_paddr == off &&
				    p->p_memsz == p->p_filesz &&
				    p->p_memsz <= off) {
					p->p_filesz = off + q->p_filesz;
					p->p_memsz = off + q->p_memsz;
				} else {
					fprintf(stderr, "Several loadable segments\n");
					exit(1);
				}
			} else
				p = &tp->tab[x];
		}
	}
	if (p == 0) {
		fprintf(stderr, "No loadable segments\n");
		exit(1);
	}

	/* Now base address is 0xf0004000. */
	/** if (p->p_vaddr != 0x4000) {		**/
	/**	fprintf(stderr, "Warning: Load address is not 0x4000\n"); **/
	/** }					**/

	/*
	 * This trick is from ecd@Pool.Informatik.RWTH-Aachen.DE,
	 * needed for native binutils-2.6.x.
	 */
	off = p->p_offset;
	len = p->p_filesz;
	if (off == 0) {
		/* Surely we are about to load garbage, try to skip page 0. */
		if (p->p_vaddr != 0xf0000000) {
			fprintf(stderr, "Warning: Kernel workaround on non-kernel image\n");
		}
		off += 0x4000;
		len -= 0x4000;
	}

	t->buf = malloc(len);
	if (t->buf == 0) {
		fprintf(stderr, "No core for program image\n");
		exit(1);
	}
	t->len = len;
	t->bss = p->p_memsz - p->p_filesz;

	if (fseek(inp, (long)off, SEEK_SET) == -1) {
		fprintf(stderr, "Seek error on program image\n");
		exit(1);
	}
	if (fread(t->buf, 1, len, inp) != len) {
		fprintf(stderr, "Read error on program image\n");
		exit(1);
	}
}

void load_image64(Segment *t, const ProgTable64 *tp, FILE *inp) {
	Elf64_Phdr *p, *q;
	unsigned x;
	unsigned long long off, len;

	p = 0;
	for (x = 0; x < tp->len; x++) {
		if (tp->tab[x].p_type == PT_LOAD) {
			if (p != 0) {
				q = &tp->tab[x];
				off = (q->p_offset - p->p_offset);
				if (q->p_vaddr - p->p_vaddr == off &&
				    q->p_paddr - p->p_paddr == off &&
				    p->p_memsz == p->p_filesz &&
				    p->p_memsz <= off) {
					p->p_filesz = off + q->p_filesz;
					p->p_memsz = off + q->p_memsz;
				} else {
					fprintf(stderr, "Several loadable segments\n");
					exit(1);
				}
			} else
				p = &tp->tab[x];
		}
	}
	if (p == 0) {
		fprintf(stderr, "No loadable segments\n");
		exit(1);
	}

	/*
	 * This trick is from ecd@skynet.be
	 * needed for native binutils-2.6.x.
	 */
	off = p->p_offset;
	len = p->p_filesz;
	if (off == 0) {
		/* Surely we are about to load garbage, try to skip page 0. */
		if (p->p_vaddr != 0x0000000000400000ULL) {
			fprintf(stderr, "Warning: Kernel workaround on non-kernel image\n");
		}
		off += 0x4000;
		len -= 0x4000;
	}

	t->buf = malloc(len);
	if (t->buf == 0) {
		fprintf(stderr, "No core for program image\n");
		exit(1);
	}
	t->len = len;
	t->bss = p->p_memsz - p->p_filesz;

	if (fseek(inp, (long)off, SEEK_SET) == -1) {
		fprintf(stderr, "Seek error on program image\n");
		exit(1);
	}
	if (fread(t->buf, 1, len, inp) != len) {
		fprintf(stderr, "Read error on program image\n");
		exit(1);
	}
}

void store_image(Segment *t, FILE *out) {
	Exec ohdb;

	if (prog.swab) {
		ohdb.a_magic = prog.csum ? swab32(CMAGIC) : swab32(AMAGIC);
		ohdb.a_text = swab32(t->len);
		ohdb.a_data = 0;
		ohdb.a_bss = swab32(t->bss);
		ohdb.a_syms = 0;
		ohdb.a_entry = swab32(0x4000);
		ohdb.a_trsize = 0;
		ohdb.a_drsize = 0;
	} else {
		ohdb.a_magic = prog.csum ? CMAGIC : AMAGIC;
		ohdb.a_text = t->len;
		ohdb.a_data = 0;
		ohdb.a_bss = t->bss;
		ohdb.a_syms = 0;
		ohdb.a_entry = 0x4000;
		ohdb.a_trsize = 0;
		ohdb.a_drsize = 0;
	}
	if (prog.csum)
		ohdb.a_syms = ipchksum(t->buf, t->len);

	if (!prog.sun4_mode) {
		if (fwrite((void*)&ohdb, 1, sizeof(Exec), out) != sizeof(Exec))
			goto ewrite;
	}
	if (fwrite(t->buf, 1, t->len, out) != t->len) goto ewrite;
	return;

ewrite:
	fprintf(stderr, "Write error on program image\n");
	exit(1);
	return;
}

void Usage(){
	if (prog.version) Version();
	fprintf(stderr, "Usage: elftoaout [-o output] [-c|-b] [-V] input\n");
	exit(1);
}

void Version(){
	printf("elftoaout 2.3: ELF to a.out convertor for SPARC and SPARC64 bootstraps\n");
}

int
ipchksum(unsigned char *data, int leng)
{
	long sum;

	sum = 0;
	while (leng >= 2) {
		leng -= 2;
		sum += (data[0] << 8) | data[1];
		sum += (sum>>16) & 1;
		sum &= 0xFFFF;
		data += 2;
	}
	if (leng) {
		sum += *data << 8;
		sum += (sum>>16) & 1;
		sum &= 0xFFFF;
	}

	return (~sum) & 0xFFFF;
}
