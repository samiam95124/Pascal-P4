parse test=test #nrf
ce test=test
ln temp=c:\ip\lib\serlib c:\ip\lib\main test c:\ip\lib\cap
genpe test=temp c:\windows\system\kernel32 c:\windows\system\user32 c:\windows\system\gdi32 c:\windows\system\winmm/v/sc
del temp.*
