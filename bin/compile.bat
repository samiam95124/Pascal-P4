@echo off
rem
rem Compile file in batch mode using GPC Pascal.
rem
rem Runs a compile with the input and output coming from/
rem going to files.
rem
rem Execution:
rem
rem Compile <file>
rem
rem <file> is the filename without extention.
rem
rem The files are:
rem
rem <file>.pas - The Pascal source file
rem <file>.p4  - The intermediate file produced
rem <file>.err - The errors output from the compiler
rem
rem Note that the l+ option must be specified to get a full
rem listing in the .err file (or just a lack of l-).
rem

if "%1"=="" (

    echo *** Error: Missing parameter
    exit /b 1

)

if not exist "%1.pas" (

    echo *** Error: Missing %1.pas file
    exit /b 1

)

pcom < %1.pas > %1.err
rem
rem The status of the compile is not returned, so convert a non-zero
rem error message to fail status
rem
grep -q "^ *[0-9]* *\*\*\*\* *\^" %1.err
if not errorlevel 1 exit /b 1
rem
rem Move the prr file to <file.p4>
rem
if exist "%1.p4" del %1.p4
copy prr %1.p4 > temp
del prr > temp
chmod +w %1.p4
del temp
