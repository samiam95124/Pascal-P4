@echo off
rem
rem Compile pint using GPC
rem
rem Note that GPC generates several unecessary warnings during
rem the compile, including use of compiler directives in comments
rem (in ISO 7185 mode it should just ignore them), and that it
rem is generating 256 element sets by default (there does not
rem seem to be any way to shut up this warning, including using the
rem --setlimit option).
rem
echo.
echo Compiling pint.pas to create pint.exe
echo.
gpc -o pint pint.pas --classic-pascal-level-0 --no-warnings --transparent-file-names --no-range-checking
