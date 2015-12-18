@echo off
rem ################################################################################
rem #
rem # Configure scipt for Pascal-p4
rem #
rem # Sets up the complete Pascal-p4 project.
rem #
rem ################################################################################

rem
rem Set default variables
rem
set compiler=gpc
set bits=32
set host=windows

rem
rem Determine if needed programs exist. The only fatal one is grep, because we
rem need that to run this script. The rest will impact the running of various
rem test and build scripts.
rem
where /q grep
if %errorlevel% equ 0 goto grepexists
echo *** No grep was found
goto stop
:grepexists
where /q gpc
if %errorlevel% equ 0 goto gpcexists
echo *** No gpc was found
goto stop
:gpcexists
where /q diff || echo *** No diff was found
where /q sed || echo *** No sed was found
where /q rm || echo *** No rm was found
where /q cp || echo *** No cp was found
where /q mv || echo *** No mv was found
where /q flip || echo *** No flip was found
where /q ls || echo *** No ls was found
where /q zip || echo *** No zip was found

rem
rem Evaluate compiler version and word size
rem
gpc -v 2> temp
grep "gpc version 20070904" temp > temp2
if %errorlevel% equ 0 goto gpccorrectver
echo *** Warning, Pascal-p4 is only validated to work with gpc version 20070904
:gpccorrectver
rm temp2
rem set bits=64
rem grep "build=x86_64" temp > temp2
rem if %errorlevel% equ 0 goto gpc64
rem set bits=32

where /q flip
if %errorlevel% equ 0 goto flipexists
echo Making flip.exe
make flip
dir bin\flip.exe > temp
grep "flip.exe" temp > temp2
if %errorlevel% equ 0 goto flipexists
echo *** Unable to make flip
:flipexists

rem
rem Check all arguments
rem

for %%x in (%*) do (

	if "%%x" == "--help" (

        echo "Configure program for Pascal-p4"
        echo
        echo "--gpc:       Select GPC as target compiler"
        echo "--ip_pascal: Select IP Pascal as target compiler"
        echo "--32:        Select 32 bit target"
        echo "--64:        Select 64 bit target"
        echo
        goto stop

	)
    if "%%x" == "--gpc" (

    	set compiler=gpc

    )
    if "%%x" == "--ip_pascal" (

		set compiler=ip_pascal

    )
    if "%%x" == "--32" (

		set bits=32

    )
    if "%%x" == "--64" (

		set bits=64

    )

)

rem
rem Set up compiler to use.
rem
rem Presently implements:
rem
rem IP Pascal, named "ip_pascal"
rem
rem GPC Pascal, named "gpc"
rem

if  not "%compiler%" == "ip_pascal" goto chkgpc

rem
rem Set up for IP Pascal
rem
cp ip_pascal\p4.bat      bin\p4.bat
cp ip_pascal\compile.bat bin\compile.bat
cp ip_pascal\run.bat     bin\run.bat

cp ip_pascal\p4          bin\p4
cp ip_pascal\compile     bin\compile
cp ip_pascal\run         bin\run

cp ip_pascal/Makefile    .

cp ip_pascal\standard_tests/iso7185pat.cmp standard_tests
cp ip_pascal\standard_tests/iso7185pats.cmp standard_tests

rem
rem IP Pascal does not care about line endings, but returning to DOS mode
rem line endings normalizes the files for SVN checkin.
rem
rem doseol

echo Compiler set to IP Pascal
goto setbits

:chkgpc

if  not "%compiler%" == "gpc" goto nonefound

rem
rem Set up for GPC Pascal
rem
cp gpc\p4.bat      bin\p4.bat
cp gpc\compile.bat bin\compile.bat
cp gpc\run.bat     bin\run.bat

cp gpc\p4          bin\p4
cp gpc\compile     bin\compile
cp gpc\run         bin\run

cp gpc/Makefile    .

cp gpc/standard_tests/iso7185pat.cmp standard_tests
cp gpc/standard_tests/iso7185pats.cmp standard_tests

rem
rem GPC needs Unix line endings in both the Unix and cygwin
rem versions.
rem
rem doseol

echo Compiler set to GPC Pascal
goto setbits

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
rem Set bit length
rem
:setbits
if "%bits%" == "32" (

    rem echo Setting for 32 bit target
    rem set32

)
if "%bits%" == "64" (

    echo *** Pascal-P4 is not capable of 64 bit at this time
    rem echo Setting for 64 bit target
    rem set64

)

echo Configure completed!

rem
rem Terminate script
rem
:stop
