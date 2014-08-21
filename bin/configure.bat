@echo off
rem
rem Set up compiler to use.
rem
rem Presently implements:
rem
rem IP Pascal, named "ip_pascal"
rem
rem GPC Pascal, named "GPC" (or "gpc")
rem

if not "%1"=="" goto paramok
echo *** Error: Missing parameter
goto stop
:paramok

if not "%1"=="ip_pascal" goto chkgpc
rem
rem Set up for IP Pascal
rem
cp ip_pascal\p4.bat      bin\p4.bat
cp ip_pascal\compile.bat bin\compile.bat
cp ip_pascal\run.bat     bin\run.bat
cp ip_pascal\cpcom.bat   bin\cpcom.bat
cp ip_pascal\cpint.bat   bin\cpint.bat

cp ip_pascal\p4          bin\p4
cp ip_pascal\compile     bin\compile
cp ip_pascal\run         bin\run
cp ip_pascal\cpcom       bin\cpcom
cp ip_pascal\cpint       bin\cpint

echo Compiler set to IP Pascal
goto stop
:chkgpc

if "%1"=="gpc" goto dogpc
if not "%1"=="GPC" goto nonefound
:dogpc
rem
rem Set up for GPC Pascal
rem
cp gpc\p4.bat      bin\p4.bat
cp gpc\compile.bat bin\compile.bat
cp gpc\run.bat     bin\run.bat
cp gpc\cpcom.bat   bin\cpcom.bat
cp gpc\cpint.bat   bin\cpint.bat

cp gpc\p4          bin\p4
cp gpc\compile     bin\compile
cp gpc\run         bin\run
cp gpc\cpcom       bin\cpcom
cp gpc\cpint       bin\cpint

echo Compiler set to GPC Pascal
goto stop

rem
rem No compiler name found!
rem
:nonefound
echo *** Compiler name does not match currently implemented
echo *** compilers.
echo.
echo IP Pascal  - use "ip_pascal"
echo GPC Pascal - use "GPC"
echo.
rem
rem Terminate script
rem
:stop
