@echo off
rem
rem Regression test
rem
rem Run the compiler through a few typical programs
rem to a "gold" standard file
rem
call testprog sample_programs\hello
call testprog sample_programs\roman
call testprog sample_programs\match
call testprog sample_programs\startrek
call testprog sample_programs\basics
call testprog sample_programs\drystone
call testprog sample_programs\fbench
call testprog sample_programs\prime
call testprog sample_programs\qsort
rem
rem Now run the ISO7185pat compliance test
rem
call testprog standard_tests\iso7185pat
rem
rem Run previous versions of the system and Pascal-S
rem
call testpascals
call testp2
call testp4
rem
rem Run pcom self compile (note this runs on P5 only)
rem
call cpcoms
rem
rem Run pint self compile (note this runs on P5 only)
rem
call cpints
