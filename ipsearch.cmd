@echo off
chcp 65001
title Welcome %username%
:: Modifdyable Variables

:: System Set Variables
set previousversion=0.0
set currentversion=0.1
:: Do  Not Tamper, Channging These Variables Without Knowledge can Affect Function
set ipsearchsays=[[40;37mIP[40;31mSEARCH[40;37m][40;37m: 
FOR /F %%a IN ('curl https://ipv4.icanhazip.com/') DO set homeipv4=%%a
FOR /F %%b IN ('curl https://icanhazip.com/') DO set homeipv6=%%b
FOR /F %%c IN ('tzutil /g') DO set TIMEZONE=%%c
:: settings scanner
set github=False
set autosave=False
set deviceexposure=True
set ipvformatsaccepted="IPV4, IPV6, DNS"
set developermode=False
set activationkeystatus=False
if exist systemfiles\.github set github=True
if exist systemfiles\.autosave set autosave=True
if exist systemfiles\.api_keyless set api=False
if exist safeips\%homeipv4%.safeip set safeip=True
if exist systemfiles\%username%.dev set developermode=True && if exist %username%.dev set deviceexposure=False
if exist systemfiles\.activation set activationkeystatus=True
set sessionkey=%random%

if exist systemfiles\.systemfile set systemfile_check=True
if not exist systemfiles\.systemfile set systemfile_check=False
if %systemfile_check%==False goto setup
if %systemfile_check%%==True goto relaunch

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
echo DRAG FILE INTO IMPORT_FILE (inside your dir)
md IMPORT_FILE
echo Press Enter Once File Is Inside "IMPORT_FILE"
pause>nul
if exist import_ipst.cmd start import_ipst.cmd
if not exist import_ipst.cmd echo File Not Valid && rmdir /S /Q IMPORT_FILE && goto themeselect
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
set /p github=Paste Github Link Here (github.com/(username)):
start www.%github%
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
echo Set an APIKEY, This will allow for unlimited requests
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
md systemfiles
echo systemfile>.systemfile
move .systemfile systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Marking Home Base (setting safe ip)
if %safeip%==True echo %homeipv4%>%homeipv4%.safeip && echo %homeipv6%>%homeipv6%.safeip
md safeips
move %homeipv4%.safeip safeips
move %homeipv6%.safeip safeips
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Painting the Walls (setting the theme)
echo %theme%>.%theme%
move .%theme% systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;31m━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
if exist .%username%dev echo Promoting User (designating developer settings)
move .%username%dev systemfile
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
echo Version Created: %currentversion%>>.reference
echo %computername%>>.reference
echo %homeipv4%>>.reference
echo %homeipv6%>>.reference
echo %github%>>.reference
echo --------------->>.reference
echo IPSEARCH🔎 2024 >>.reference
move .reference systemfiles
echo www.github>.github
move .github systemfiles
echo %currentversion%>.%currentversion%
move .%currentversion% systemfiles
echo free palestine>.activation
move .activation systemfiles
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Connecting To Netowrk
curl http://ip-api.com/line/%usersetip%?fields=query
PING -n 1 8.8.8.8 | FIND "TTL=">nul && echo [40;33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PING -n 1 8.8.8.8 | FIND "TTL=">nul && cls
echo Adding Some Finishing Touches...
md speechlogs
md iplogs
md autosavedata
:RECENTIPS
echo     ____                       __  __         __  __              __   ________ _      >recentips.txt
echo    / __ \___  ________  ____  / /_/ /_  __   / / / /_______  ____/ /  /  _/ __ ( )_____>>recentips.txt
echo   / /_/ / _ \/ ___/ _ \/ __ \/ __/ / / / /  / / / / ___/ _ \/ __  /   / // /_/ /// ___/>>recentips.txt
echo  / _, _/  __/ /__/  __/ / / / /_/ / /_/ /  / /_/ (__  )  __/ /_/ /  _/ // ____/ (__  ) >>recentips.txt
echo /_/ l_l\___/\___/\___/_/ /_/\__/_/\__, /   \____/____/\___/\__,_/  /___/_/     /____/  >>recentips.txt
echo                                  /____/                                              >>recentips.txt
echo --------------------------------------------------------------------------------------->>recentips.txt
echo.>>recentips.txt
echo.>>recentips.txt
pause
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

:relaunch
set /a num=%random% %%6
::add set
if %num%==1 set ad=AD: Use Google.com Today
if %num%==2 set ad=AD: Use Facebook.com Today
if %num%==3 set ad=.
if %num%==4 set ad=.
if %num%==5 set ad=.
:: themes
if exist systemfiles\.RED set theme=[40;31m
if exist systemfiles\.YELLOW set theme=[40;33m
if exist systemfiles\.GREEN set theme=[40;32m
if exist systemfiles\.BLUE set theme=[40;34m
if exist systemfiles\.PURPLE set theme=[40;35m
set ipsearchsays=[[40;37mIP%theme%SEARCH[40;37m][40;37m:
if %num%==5 set message2=[40;31mH[40;33mE[40;32mL[40;34mL[40;35mO [40;31mW[40;33mO[40;32mR[40;34mL[40;35mD[40;37m
set message1=%ipsearchsays%Welcome Back %username%!
set message=%ipsearchsays%No Proccesses Were Active
:main
title Welcome Back %username% │ IPSEARCH🔎 │ In The Menus
:: log msgs
echo %usermessage%>%usermessage%.usrsays
move %usermessage%.usrsays speechlogs

:: start variables
set targetip=%homeipv4%
set targetipformat=IPV4
set message6=%message5%
set message5=%message4%
set message4=%message3%
set message3=%message2%
set message2=%message1%
set message1=%message%
:: msgbox char limit = 41
:: >41 will be out of box
cls
echo %ad%
echo [40;37m╔═════════════════════════════════════════╗
echo [40;37m║[40;37m  _      %theme%                         _      [40;37m║
echo [40;37m║[40;37m (_)_ __ %theme% ___  ___  __ _ _ __ ___│ │__   [40;37m║ 
echo [40;37m║[40;37m │ │ '_ \%theme%/ __│/ _ \/ _` │ '__/ __│ '_ \  [40;37m║ 
echo [40;37m║[40;37m │ │ │_) %theme%\__ \  __/ (_│ │ │ │ (__│ │ │ │ [40;37m║ 
echo [40;37m║[40;37m │_│ .__/%theme%│___/\___│\__,_│_│  \___│_│ │_│ [40;37m║ 
echo [40;37m║[40;37m   │_│   %theme%                                [40;37m║[40;37m
echo ╠════════════════Alerts═══════════════════╣
echo ║→ %message6%
echo ║→ %message5%
echo ║→ %message4%
echo ║→ %message3%
echo ║→ %message2%
echo ║→ %message%
echo ╠═════════════════════════════════════════╣
echo [40;37m║                                         [40;37m║
echo [40;37m║ [[40;31m1[40;37m] This Systems IP                     [40;37m║
echo [40;37m║ [[40;31m2[40;37m] Search IP                           [40;37m║
echo [40;37m║ [[40;31m4[40;37m] Settings                            [40;37m║
echo [40;37m║ [[40;31m5[40;37m] Recent IP's                         [40;37m║ 
echo [40;37m║ [[40;31m0[40;37m] Imported Apps                       [40;37m║ 
echo [40;37m║                                         [40;37m║ 
echo [40;37m╚═════════════════════════════════════════╝
set /p choice=-:
if %choice%==echomsg goto echo
if %choice%==clearmsg goto clearmsg
if %choice%==askmsg goto ask
if %choice%==1 goto systemip
if %choice%==2 goto searchip
if %choice%==4 goto settings
if %choice%==5 start recentips.txt
if %choice%==0 goto importeddata
set message=[40;31mInvalid Input[40;37m && goto main

:echo
set /p usermessage=echo 
set message=[%theme%%username%[40;37m] %usermessage%
goto main

:clearmsg
set message= && set message1= && set message2= && set message3= && set message4= && set message5=
goto main
:: ask the program questions (eastereggs/help)
:ask
set /p usermessage=
if %usermessage%==Hello set message1=[%theme%%username%[40;37m] %usermessage% && set message=%ipsearchsays%Well Hello There %username% && goto main
if %usermessage%==MyIP set message1=[%theme%%username%[40;37m] %usermessage% && set message=%ipsearchsays%[%homeipv4%] && goto main
if %usermessage%==Credits set message1=[%theme%%username%[40;37m] %usermessage% && set message=%ipsearchsays%github.com/sjapanwala && goto main
if %usermessage%==SetModules set message1=[%theme%%username%[40;37m] %usermessage% && set message=%ipsearchsays%Making Module Files && goto makemodulefiles
if %usermessage%==Access set message1=[%theme%%username%[40;37m] %usermessage% && goto accesspath
set message=[%theme%%username%[40;37m] %usermessage%
goto main


:systemip
cls
curl http://ip-api.com/?fields=status,message,continent,continentCode,country,countryCode,region,regionName,city,district,zip,lat,lon,timezone,offset,currency,isp,org,as,asname,mobile,proxy,hosting,query
pause>nul
set message=[40;32mCommand Executed Successfully[40;37m
goto main

:makemodulefiles
if exist modules\.module set message=%ipsearchsays%Modules Already Exist && goto main
md modules
echo this file makes sure that modules exist>.module
move .module modules
set message=%ipsearchsays%Module File Made! && goto main

:accesspath
set /p accesspath=:
set message=%ipsearchsays%Going To %accesspath% && goto main


:settings
cls
echo [40;37m------------------Settings------------------
echo.
echo Version State---------------:%currentversion%
echo Current Formats Accepted----:%ipvformatsaccepted%
echo Developer Mode--------------:%developermode%
echo Safe IP Mode----------------:%safeip%
echo Device Exposure-------------:%deviceexposure%
echo Auto Save-------------------:%autosave%
echo.
echo ------------------Details-------------------
echo.
echo API Key --------------------:%api%
echo Computer Name---------------:%computername%
echo User Name-------------------:%username%
echo IP--------------------------:%homeipv4%
echo Time Zone-------------------:%TIMEZONE%
echo Activation Status-----------:%activationkeystatus%
echo Activation Key--------------:%sessionkey%
echo GitHub Connection-----------:%github%
set message=[40;32mCommand Executed Successfully[40;37m
pause>nul
goto main

:searchip
cls
echo ╔═════════════════════════════════════════════╗
echo  ┍This Devices [[40;32mIPV4[40;37m]
echo  └[[40;31m*[40;37m] %homeipv4%
echo ╚═════════════════════════════════════════════╝
echo.
echo Set Your Target IP Form As [[40;32mIPV4[40;37m] or [[40;32mIPV6[40;37m] or [[40;32mDNS[40;37m]
set /p usersetiptype=→ 
if %usersetiptype%==IPV4 goto continueipset
if %usersetiptype%==IPV6 goto continueipset
if %usersetiptype%==DNS goto finddns
goto iptypenotsupported

:finddns
echo Set Your Target DNS Following the Format Entered Previously
set /p usersetdns=→ 
FOR /F %%d IN ('nslookup %usersetdns%/') DO set dnsip=%%d
echo %dnsip%
:continueipset
echo Set Your Target IP Following the Format Entered Previously
set /p usersetip=→ 

::check if IP is valid, usable, or block listed
if %usersetiptype%==IPV4 goto verifysetipsite1
if %usersetiptype%==IPV6 goto verifysetipsite1
:verifysetipsite1
echo - %usersetip%>>recentips.txt
set ipname=.%usersetip%
echo %usersetip%>%ipname%
move %ipname% iplogs

echo ╔═════════════════════════════════════════════╗
curl http://ip-api.com/line/%usersetip%?fields=query
curl http://ip-api.com/line/%usersetip%?fields=status
curl http://ip-api.com/line/%usersetip%?fields=message
curl http://ip-api.com/line/%usersetip%?fields=org
echo ╚═════════════════════════════════════════════╝
echo.
echo If Line Says---: success, Connection Is Good
echo If Line Says---: fail   , Connection Is Bad
set message=[40;32mCommand Executed Successfully[40;37m
set /p cont=Continue? (y/n)
if %cont%==y goto cont
if %cont%==Y goto cont
if %cont%==n goto main
if %cont%==N goto main
echo.
:cont
curl https://ipapi.co/%usersetip%/json/
pause>nul
if %autosave%==False goto main
if exist autosavedata\usersetip.txt goto main
:writefile
curl https://ipapi.co/%usersetip%/json/>>%usersetip%.txt
move %usersetip%.txt autosavedata
goto main

:: no preset code will be written after this point, all the code written after this point is only allowed by user
:importeddata
if exist modules\.module goto importdatasetup
if not exist modules\.module set message=[40;31mCannot Use [40;33mPlease Set Modules[40;37m && goto main
:importdatasetup
