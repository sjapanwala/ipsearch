@echo off
chcp 65001
title Welcome %username%
:: Modifdyable Variables

:: System Set Variables
:: Do  Not Tamper, Channging These Variables Without Knowledge can Affect Function
set ipsearchsays=[[40;37mIP[40;31mSEARCH][40;37m: 
FOR /F %%a IN ('curl https://ipv4.icanhazip.com/') DO set homeipv4=%%a
FOR /F %%c IN ('curl https://icanhazip.com/') DO set homeipv6=%%b

if exist systemfiles\.systemfile set systemfile_check=True
if not exist systemfiles\.systemfile set systemfile_check=False
if %systemfile_check%==False goto setup
if %systemfile_check%%==True goto main

:setup
title IPSEARCH🔎 │ Setting Up...
cls
echo [40;37m  _      [40;31m                         _     
echo [40;37m (_)_ __ [40;31m ___  ___  __ _ _ __ ___│ │__  
echo [40;37m │ │ '_ \[40;31m/ __│/ _ \/ _` │ '__/ __│ '_ \  
echo [40;37m │ │ │_) [40;31m\__ \  __/ (_│ │ │ │ (__│ │ │ │ 
echo [40;37m │_│ .__/[40;31m│___/\___│\__,_│_│  \___│_│ │_│ 
echo [40;37m   │_│   [40;31m                               [40;37m
echo.
echo %ipsearchsays%Welcome %username%, this is IPSEARCH🔎.
echo %ipsearchsays%Before we start, we need to ask a few questions in order to get you set up!
echo.
echo %ipsearchsays%Have you used IPST in the past? If so, you can import your settings directly!
set /p choice=(Y/N): 
if %choice%==Y goto importipst
if %choice%==y goto importipst
if %choice%==N goto skipipst
if %choice%==n goto skipipst
goto setup

:importipst
echo DRAG FILE INTO IMPORT_FILE
cd IMPORT_FILE
if exist import_ipst.cmd start import_ipst.cmd
if not exist import_ipst.cmd echo File Not Valid && goto themeselect
:skipipst
echo.
echo %ipsearchsays%Thats ok! lets set you up.
echo.
:themeselect
set /p theme=Please Choose A Colour For Your Theme! ([40;31mR,[40;33mY,[40;32mG,[40;34mB,[40;35mP[40;37m): 
if %theme%==r set theme=RED && goto colordone
if %theme%==y set theme=YELLOW && goto colordone
if %theme%==g set theme=GREEN && goto colordone
if %theme%==b set theme=BLUE && goto colordone
if %theme%==p set theme=PURPLE && goto colordone
echo.
echo Seems Like Thats Not A Colour...
goto themeselect

:colordone
echo.
echo %ipsearchsays% OOO.. so you chose %theme%! Good Choice! your theme will be applied once we are finished
:connectgithub
set /p github=Connect a Github? (Y/N): 
if %github%==Y goto entergithub
if %github%==y goto entergithub
if %github%==N goto apikey
if %github%==n goto apikey
echo.
echo Please Enter A Valid Response
goto connectgithub
:entergithub
set /p github=Paste Github Link Here:
start github
set /p choice=Is This The Correct Page? (Y/N)
if %choice%==Y goto informationsetup
if %choice%==y goto informationsetup
if %choice%==N goto entergithub
if %choice%==n goto entergithub
echo.
echo Please Enter a Valid Response
goto entergithub
:informationsetup
echo.
echo %ipsearchsays%Now for the important information
echo.
:apikey
set /p APIKEY=(will not cap requests, enter "keyless" to proceed without a key):
:settings
echo --- SETTINGS ---
set /p safeip=Save %homeipv4% As A Safe IP? (Y/N): 
if %safeip%==Y set safeip=True  && goto autosave
if %safeip%==y set safeip=True && goto autosave
if %safeip%==N set safeip=False && goto autosave
if %safeip%==n set safeip=False && goto autosave
echo.
echo Please Enter A Valid Response
goto settings
:autosave
set /p autosave=Autosave on? (Y/N): 
if %autosave%==Y set autosave=True && goto developerpinchoice
if %autosave%==y set autosave=True && goto developerpinchoice
if %autosave%==N set autosave=Fals && goto developerpinchoice
if %autosave%==n set autosave=Fals && goto developerpinchoice
echo.
echo Please Enter A Valid Response
goto autosave
:developerpinchoice
set /p developerpin=Do You Have A Developer Pin? (Y/N): 
if %developerpin%==Y goto developerpinenter
if %developerpin%==y goto developerpinenter
if %developerpin%==N goto skipdevpin
if %developerpin%==n goto skipdevpin
echo.
echo Please Enter A Valid Response
goto developerpinchoice
:faileddev
echo Verification Failed...
rename developerfile.cmd .%verifydevpin%%
del failedverification
:developerpinenter
echo.
set /p verifydevpin=Please Enter Developer Pin ("exit" to back out): 
if %verifydevpin%==exit goto skipdevpin
if exist .%verifydevpin% goto waitfordevfile
echo This Is Not A Developer Pin.
goto developerpinenter

:waitfordevfile
rename .%verifydevpin% developerfile.cmd
start developerfile.cmd
:waiting
echo.
cls
echo ╔════╤╤╤╤════╗ 
echo ║    │││ \   ║ 
echo ║    │││  O  ║ 
echo ║    OOO     ║
echo Waiting.
timeout 1 > nul
cls
echo ╔════╤╤╤╤════╗
echo ║    ││││    ║
echo ║    ││││    ║
echo ║    OOOO    ║
echo Waiting..
timeout 1 > nul
cls
echo ╔════╤╤╤╤════╗
echo ║   / │││    ║
echo ║  O  │││    ║
echo ║     OOO    ║
echo Waiting...
timeout 1 > nul
cls
echo ╔════╤╤╤╤════╗
echo ║    ││││    ║
echo ║    ││││    ║
echo ║    OOOO    ║
echo Waiting....
timeout 1 > nul
cls
echo.
if exist .%username%dev goto afterdev
if exist failedverification goto faileddev
goto waiting
pause
:afterdev
rename developerfile.cmd .%verifydevpin%
echo %ipsearchsays%Ok Great We Have Verified You!
:skipdevpin
echo %ipsearchsays%That Should Be It...
echo %ipsearchsays%Oh Wait, I need to verify that you are an actual person, and not an IPSpammer.
echo %ipsearchsays%Please Enter The Code That Is On Your Screen Right Now!
:onscreenverification
set onscreenverificationcode=%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %onscreenverificationcode%>verification.txt
start verification.txt
set /p onscreenverification=Please Enter The Code:
if %onscreenverification%==%onscreenverificationcode% goto finalize
echo Verificat Failed... && del verification.txt && goto onscreenverification
:finalize
del verification.txt
echo %ipsearchsays%All Right You Have Proved Yourself, Please Wait While Your Files Are Made
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Creating System Files
cd systemfiles
echo systemfile>.systemfile
move .systemfile systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Marking Home Base (setting safe ip)
if %safeip%==True echo %homeipv4%>.%homeipv4 && echo %homeipv6>.%homeipv6
cd safeips
move .%homeipv4 safeips
move .%homeipv6% safeips
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Painting the Walls (setting the theme)
echo %theme%>.%theme%
move .%theme% systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
if exist .%username%dev echo Promoting User (designating developer settings)
if exist .%username%dev echo .developer && del .%username%dev
if exist .developer move .developer systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Calling API
echo %apikey%>.api_%apikey%
move .api_%apikey% systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Hiring a Writer (Autosave)
if %autosave%==True echo autosave>.autosave
move .autosave systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Creating User Reference
echo %username%>.reference
echo --------------->>.reference
echo %computername%>>.reference
echo %homeipv4%>>.reference
echo %homeipv6%>>.reference
echo %github%>>.reference
echo --------------->>.reference
echo IPSEARCH🔎 2024 >>.reference
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Connecting To Netowrk
curl http://ip-api.com/line/%usersetip%?fields=query
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Adding Some Finishing Touches...
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
cls
echo  ________  ________  ________   _______   ___       
echo │\   ___ \│\   __  \│\   ___  \│\  ___ \ │\  \      
echo \ \  \_│\ \ \  \│\  \ \  \\ \  \ \   __/│\ \  \     
echo  \ \  \ \\ \ \  \\\  \ \  \\ \  \ \  \_│/_\ \  \    
echo   \ \  \_\\ \ \  \\\  \ \  \\ \  \ \  \_│\ \ \__\   
echo    \ \_______\ \_______\ \__\\ \__\ \_______\│__│   
echo     \│_______│\│_______│\│__│ \│__│\│_______│   ___ 
echo                                                │\__\
echo                                                \│__│
echo ReLaunching...
timeout 3 >nul
start ipsearch.cmd && exit                                                 
