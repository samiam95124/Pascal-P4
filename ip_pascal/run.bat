@echo off
rem
rem Run a Pascal file in batch mode using IP Pascal
rem
rem Runs a Pascal intermediate in batch mode.
rem
rem Execution:
rem
rem run <file>
rem
rem <file> is the filename without extention.
rem
rem The files are:
rem
rem <file>.p5  - The intermediate file
rem <file>.out - The prr file produced
rem <file>.inp - The input file to the program
rem <file>.lst - The output file from the program
rem

if not "%1"=="" goto paramok
echo *** Error: Missing parameter
goto stop
:paramok

if exist "%1.p5" goto fileexists1
echo *** Error: Missing %1.p5 file
goto stop
:fileexists1

if exist "%1.inp" goto fileexists2
echo *** Error: Missing %1.inp file
goto stop
:fileexists2

pint %1.p5 %1.out < %1.inp > %1.lst
rem
rem Terminate
rem
:stop
