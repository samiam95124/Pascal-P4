@echo off
rem
rem Compile with p4 using IP Pascal
rem
rem Execute with:
rem
rem p4 <file>
rem
rem where <file> is the name of the source file without
rem extention. The Pascal file is compiled and run.
rem Any compiler errors are output to the screen. Input
rem and output to and from the running program are from
rem the console, but output to the prr file is placed
rem in <file>.out.
rem The intermediate code is placed in <file>.p4.
rem

if not "%1"=="" goto paramok
echo *** Error: Missing parameter
goto stop
:paramok

if exist "%1.pas" goto fileexists
echo *** Error: Missing %1.pas file
goto stop
:fileexists

echo.
echo Compiling and running %1
echo.
pcom %1.p4 < %1.pas
pint %1.p4 %1.out
rem
rem Terminate
rem
:stop
