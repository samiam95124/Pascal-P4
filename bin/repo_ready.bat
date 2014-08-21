@echo off
rem
rem Make p5 ready for SVN
rem
rem This script fixes up the SVN directories to the form that SVN
rem expects. This minimizes the differences between the P5 directories
rem and the SVN repository in preparation for checkins.
rem
call configure ip_pascal
call clean
