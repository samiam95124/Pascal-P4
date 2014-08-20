parse test=test #nrf
ce test1=test1
ln temp=c:\ip\lib\serlib c:\ip\lib\main test1 c:\ip\lib\cap
genpe test1=temp c:\windows\system\kernel32 c:\windows\system\user32 c:\windows\system\gdi32 c:\windows\system\winmm/v/sc
del temp.*
