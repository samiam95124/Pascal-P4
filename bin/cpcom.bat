@echo off
rem
rem Compile pcom using GPC
rem
rem Note that GPC generates several unecessary warnings during
rem the compile, including use of compiler directives in comments
rem (in ISO 7185 mode it should just ignore them), and that it
rem is generating 256 element sets by default (there does not
rem seem to be any way to shut up this warning, including using the
rem --setlimit option).
rem
echo.
echo Compiling pcom.pas to create pcom.exe
echo.
gpc -o pcom pcom.pas --classic-pascal-level-0 --no-warnings --transparent-file-names --no-range-checking
