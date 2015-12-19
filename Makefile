#
# Makefile for Pascal-p4
#
# Makes the main compiler interpreter set.
#
PC=gpc
CFLAGS=--classic-pascal-level-0 --no-warnings --transparent-file-names --no-range-checking

all: pcom pint

pcom: source/pcom.pas
	$(PC) $(CFLAGS) -o bin/pcom source/pcom.pas
	
pint: source/pint.pas
	$(PC) $(CFLAGS) -o bin/pint source/pint.pas

#
# This level clean forces everything to be rebuilt.
#
clean:
	rm -f bin/pcom bin/pint 
	find . -name "*.p4" -type f -delete
	find . -name "*.out" -type f -delete
	find . -name "*.lst" -type f -delete
	find . -name "*.obj" -type f -delete
	find . -name "*.sym" -type f -delete
	find . -name "*.int" -type f -delete
	find . -name "*.dif" -type f -delete
	find . -name "*.err" -type f -delete
	find . -name "*.tmp" -type f -delete
	find . -name "prd" -type f -delete
	find . -name "prr" -type f -delete
	find . -name "temp" -type f -delete
	find . -name "tmp" -type f -delete
	find . -name "*~" -type f -delete

#
# This level clean makes the directory look
# like the repository.
#
repository_clean:
	find . -name "*.p4" -type f -delete
	
#
# Make ready for repository
#
# This target makes the code ready for the repository.
# We configure for GPC 32 bit as normal target, and clean
# all files.
#
repo_ready:
	configure --gpc --32
	
#
# Make flip program
#
flip:
	gcc -o bin\flip c_support\flip.c
	
#
# Make archive
#
archive:
	rm pascal-p4.tar.gz
	tar --exclude='./.git' --exclude='./.cproject' --exclude='./.project' -zcvf pascal-p4.tar.gz .