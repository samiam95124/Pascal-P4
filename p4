#!/bin/bash
#
# Compile with p4 using GPC Pascal
#
# Execute with:
#
# p4 <file>
#
# Where <file> is the name of the source file without
# extention. The Pascal file is compiled and run.
# Any compiler errors are output to the screen. Input
# and output to and from the running program are from
# the console, but output to the prr file is placed
# in <file>.out.
# The intermediate code is placed in <file>.p4.
#

if [ -z "$1" ]
then

   echo "*** Error: Missing parameter"
   exit 1

fi

if [ ! -f $1.pas ]
then

   echo "*** Error: Missing $1.pas file"
   exit 1

fi

echo
echo Compiling and running $1
echo
./pcom < $1.pas
mv prr $1.p4
cp $1.p4 prd 
./pint
