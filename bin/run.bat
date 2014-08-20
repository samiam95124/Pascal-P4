@echo off
rem
rem Run a Pascal file in batch mode using GPC Pascal
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
rem <file>.p4  - The intermediate file
rem <file>.out - The prr file produced
rem <file>.inp - The input file to the program
rem <file>.lst - The output file from the program
rem

if "%1"=="" (

    echo *** Error: Missing parameter
    exit /b 1

)

if not exist "%1.p4" (

    echo *** Error: Missing %1.p4 file
    exit /b 1

)

if not exist "%1.inp" (

    echo *** Error: Missing %1.inp file
    exit /b 1

)

copy %1.p4 prd > temp
pint < %1.inp > %1.lst 2>&1
if exist "%1" del %1.out
copy prr %1.out > temp
if not exist "prr" del prr
chmod +w %1.out
del temp
