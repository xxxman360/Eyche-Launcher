@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=H:\RobloxRevivals\Eyche\Launcher.exe
REM BFCPEICON=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\icon_o8z_icon.ico
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=1
REM BFCPEVERVERSION=1.0.5.0
REM BFCPEVERPRODUCT=Eyche Launcher
REM BFCPEVERDESC=Eyche join screen UI
REM BFCPEVERCOMPANY=xxxman360's tools
REM BFCPEVERCOPYRIGHT=Copyright (C) 2016-2019
REM BFCPEEMBED=H:\!XXX----4KIDS-HP BACKUP----XXX!\RoWay\FileDownloader.exe
REM BFCPEEMBED=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\bkg.bmp
REM BFCPEEMBED=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\bkg_credits.bmp
REM BFCPEEMBED=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\bkg_loading.bmp
REM BFCPEEMBED=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\cmdmenusel.exe
REM BFCPEEMBED=H:\RobloxRevivals\Eyche\SOURCE_CODE_DO_NOT_DELETE\insertbmp.exe
REM BFCPEOPTIONEND
@ECHO ON
@echo off
setlocal EnableDelayedExpansion
IF NOT EXIST %cd%\launcher md %cd%\launcher
set gmver=1.0.5
attrib +s +h %localappdata%\temp\ytmp
attrib +s +h %localappdata%\temp\afolder
::Created by xxxman360#3184
color b0
title Eyche [%gmver%]
mode con lines=50 cols=100
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" mode con lines=37 cols=100
::Windows 10 resolution support
set membership=None
set rendertype=3d
::Declairs these variables incase they're using an older copy
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if not exist %cd%\launcher\config.ini goto setup
::Variables are collected
(
set /p app=
set /p user=
set /p id=
set /p rendertype=
set /p membership=
)<%cd%\launcher\config.ini

(
set /p servers=
)<%cd%\launcher\servers.txt
IF EXIST %cd%\launcher\version.txt del %cd%\launcher\version.txt
echo Connecting to server, please wait. . .
%MYFILES%\FileDownloader.exe "http://66.78.126.165/game/Version.txt" "%cd%\launcher\version.txt"
(
set /p currentversion=
)<%cd%\launcher\version.txt
del %cd%\launcher\version.txt
IF NOT %currentversion%==%gmver% goto update
:main
if not x%app:https=%==x%app% set app=http%app:~5,10000%
IF EXIST %cd%\launcher\config.ini del %cd%\launcher\config.ini
echo %app%>>%cd%\launcher\config.ini
echo %user%>>%cd%\launcher\config.ini
echo %id%>>%cd%\launcher\config.ini
echo %rendertype%>>%cd%\launcher\config.ini
echo %membership%>>%cd%\launcher\config.ini
IF EXIST %cd%\launcher\servers.txt del %cd%\launcher\servers.txt
IF "%servers%" NEQ "" echo %servers%>>%cd%\launcher\servers.txt
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
%MYFILES%\cmdmenusel 0870 "Play" "Join Server" "Host Server" "Saved Servers" "Settings" "Credits" "Exit"
IF %ERRORLEVEL%==1 goto play
IF %ERRORLEVEL%==2 goto join
IF %ERRORLEVEL%==3 goto host
IF %ERRORLEVEL%==4 goto savsvrs
IF %ERRORLEVEL%==5 goto settings
IF %ERRORLEVEL%==6 goto credits
IF %ERRORLEVEL%==7 exit
:setup
echo Thank you for downloading Eyche^^! It means a lot to me. h
echo Let's set things up for the first time.
echo.
set /p user=What do you want your username to be? 
if "%user%"=="" set "user=Guest %random%"
echo Do you want a custom user ID, or a random one?
echo 1. Custom
echo 2. Random
set /p idsel=Type in a number and press ENTER: 
if %idsel%==1 goto customid
set id=%random%
:continuesetup
echo What do you want your character appearance to be? Please enter a URL: 
echo Examples (http://finobe.com/user/getinstancecharapp/3915/1, http://nobelium.xyz/user/getcharapp/90): 
set /p app=
if [%app%]==[] set app=http://66.78.126.165/asset/1337.txt
echo Alright^^! Thanks for setting up^^! You can change these settings at any time.
ping localhost -n 4 >nul
goto main
:play
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo What server do you want to play?:
%MYFILES%\cmdmenusel 0870 "2009 Server" "2010 Server" "2011 Server" "2013 Server" "2014 Server" "Go back to menu"
IF %ERRORLEVEL%==1 set year=2009
IF %ERRORLEVEL%==2 set year=2010
IF %ERRORLEVEL%==3 set year=2011
IF %ERRORLEVEL%==4 set year=2013
IF %ERRORLEVEL%==5 set year=2014
IF %ERRORLEVEL%==6 goto main
%MYFILES%\insertbmp /p:%MYFILES%\bkg_loading.bmp
IF %year%==2009 start %cd%\%year%\eyche.exe -script loadfile('http://66.78.126.165/game/Join1.php')('66.78.126.165',5001,0,'"%user%"','%app%',%id%);
IF %year%==2010 start %cd%\%year%\eyche.exe -script loadfile('http://66.78.126.165/game/Join.php')('66.78.126.165',5002,0,'"%user%"','%app%',%id%);
IF %year%==2011 start %cd%\%year%\eyche.exe -script "loadfile('http://66.78.126.165/game/join2.php?username=%user%&ip=66.78.126.165&port=5003&id=%id%&app=%app%&membership=%membership%')();"
IF %year%==2013 start %cd%\%year%\Eyche -j "http://66.78.126.165/game/join2.php?username=%user%&ip=66.78.126.165&port=5004&id=%id%&app=%app%&membership=%membership%"
IF %year%==2014 start %cd%\%year%\Eyche.exe -a "eyche" -t "isgood" -j "http://66.78.126.165/game/join.ashx?username=%user%&ip=66.78.126.165&port=1002&id=%id%&app=%app%&membership=%membership%"
ping localhost -n 3 >nul
goto main
:join
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Please choose a client to connect with:
%MYFILES%\cmdmenusel 0870 "2009" "2010" "2011" "2013" "2014" "Go back to menu"
IF %ERRORLEVEL%==1 set year=2009
IF %ERRORLEVEL%==2 set year=2010
IF %ERRORLEVEL%==3 set year=2011
IF %ERRORLEVEL%==4 set year=2013
IF %ERRORLEVEL%==5 set year=2014
IF %ERRORLEVEL%==6 goto main
set /p ip=Enter server IP (Leave blank for localhost): 
:enterport
::Enterport is used when calling from the saved servers
set /p port=Enter server port (Leave blank for 53640): 
if "%ip%"=="" set ip=localhost
if "%port%"=="" set port=53640
%MYFILES%\insertbmp /p:%MYFILES%\bkg_loading.bmp
IF %year%==2009 start %cd%\%year%\eyche.exe -script loadfile('http://66.78.126.165/game/Join1.php')('%ip%',%port%,0,'"%user%"','%app%',%id%);
IF %year%==2010 start %cd%\%year%\eyche.exe -script loadfile('http://66.78.126.165/game/Join.php')('%ip%',%port%,0,'"%user%"','%app%',%id%);
IF %year%==2011 start %cd%\%year%\eyche.exe -script "loadfile('http://66.78.126.165/game/join2.php?username=%user%&ip=%ip%&port=%port%&id=%id%&app=%app%&membership=%membership%')();"
IF %year%==2013 start %cd%\%year%\Eyche -j "http://66.78.126.165/game/join2.php?username=%user%&ip=%ip%&port=%port%&id=%id%&app=%app%&membership=%membership%"
IF %year%==2014 start %cd%\%year%\Eyche.exe -a "eyche" -t "isgood" -j "http://66.78.126.165/game/join.ashx?username=%user%&ip=%ip%&port=%port%&id=%id%&app=%app%&membership=%membership%"
ping localhost -n 3 >nul
goto main
:host
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Please choose a client to host on:
%MYFILES%\cmdmenusel 0870 "2009" "2010" "2011" "2013" "2014" "Go back to menu"
IF %ERRORLEVEL%==1 set year=2009
IF %ERRORLEVEL%==2 set year=2010
IF %ERRORLEVEL%==3 set year=2011
IF %ERRORLEVEL%==4 set year=2013
IF %ERRORLEVEL%==5 set year=2014
IF %ERRORLEVEL%==6 goto main
set /p map=Drag map file into this window: 
set /p port=Enter server port (Leave blank for 53640): 
if not exist "%map%" echo Map does not exist^^! && ping localhost -n 3 >nul && goto host
if "%port%"=="" set port=53640
%MYFILES%\insertbmp /p:%MYFILES%\bkg_loading.bmp
IF EXIST %cd%\%year%\content\temp.rbxl del %cd%\%year%\content\temp.rbxl
IF %year%==2014 copy %map% %cd%\%year%\content\temp.rbxl >nul && echo No3d doesn't exist on 2014 :( && start %cd%\%year%\Eyche.exe -a "eyche" -t "isgood" -j "http://66.78.126.165/game/gameserver.ashx?port=%port%"
IF %year%==2013 copy %map% %cd%\%year%\content\temp.rbxl >nul && start %cd%\%year%\Eyche -j "http://66.78.126.165/game/Host2.php?port=%port%" -%rendertype%
IF %year%==2011 start %cd%\%year%\eyche.exe %map% -script "loadfile('http://66.78.126.165/game/Host.php')(%port%); game.Workspace:InsertContent('rbxasset://Fonts//content.rbxm')" -%rendertype%
IF %year%==2010 start %cd%\%year%\eyche.exe %map% -script "loadfile('http://66.78.126.165/game/Host.php')(%port%); game.Workspace:InsertContent('rbxasset://Fonts//libraries.rbxm')" -%rendertype%
IF %year%==2009 start %cd%\%year%\eyche.exe %map% -script loadfile('http://66.78.126.165/game/Host.php')(%port%); -%rendertype%
ping localhost -n 3 >nul
goto main
:settings
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo This is the settings page, what you like to do?
%MYFILES%\cmdmenusel 0870 "Change Appearance" "Change Username" "Change User ID" "Change Membership type BC/TBC/OBC" "Toggle no3d/3d" "Add a server to saved" "Clear saved servers" "Go back to menu"
IF %ERRORLEVEL%==1 goto chgapp
IF %ERRORLEVEL%==2 goto chgusr
IF %ERRORLEVEL%==3 goto chgid
IF %ERRORLEVEL%==4 goto chgmbr
IF %ERRORLEVEL%==5 goto chgrnd
IF %ERRORLEVEL%==6 goto addsvr
IF %ERRORLEVEL%==7 goto clrsvr
IF %ERRORLEVEL%==8 goto main
:chgapp
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set app=
echo What would you like to change your appearance to? Please enter a URL: 
set /p app=Examples (http://finobe.com/user/getinstancecharapp/56/0, http://nobelium.xyz/user/getcharapp/34): 
if [%app%]==[] set app=http://66.78.126.165/asset/1337.txt
goto settings
:customid
set /p id=Please enter in a number that you want your ID to be: 
echo Updating...
goto continuesetup
:chgusr
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set user=
set /p user=What do you want to change your username to? Try to keep it clean though: 
if "%user%"=="" set "user=Guest %random%"
echo Settings updated^^!
ping localhost -n 3 >nul
goto settings
:chgid
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set id=
set /p id=What do you want to change your ID to? (Leave blank for random): 
if "%id%"=="" set id=%random%
echo Settings updated^^!
ping localhost -n 3 >nul
goto settings
:chgrnd
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo No3d/3d server settings
%MYFILES%\cmdmenusel 0870 "No3d (Faster server, just sound and server stats only)" "3d (Normal 3d world server)"
IF %ERRORLEVEL%==1 set rendertype=no3d
IF %ERRORLEVEL%==2 set rendertype=3d
echo Settings updated^^!
ping localhost -n 3 >nul
goto settings
:clrsvr
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Are you sure you want to clear your servers list? WARNING: This cannot be undone^^!
%MYFILES%\cmdmenusel 0870 "Yes" "No"
IF %ERRORLEVEL%==1 set servers=
IF %ERRORLEVEL%==2 goto settings
echo Finished
ping localhost -n 3 >nul
goto settings

:chgmbr
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo What type of Builders Club do you want?
%MYFILES%\cmdmenusel 0870 "None" "Builders Club" "Turbo Builders Club" "Outrageous Builders Club"
IF %ERRORLEVEL%==1 set membership=None
IF %ERRORLEVEL%==2 set membership=BuildersClub
IF %ERRORLEVEL%==3 set membership=TurboBuildersClub
IF %ERRORLEVEL%==4 set membership=OutrageousBuildersClub
echo Settings updated^^!
ping localhost -n 3 >nul
goto settings
:savsvrs
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
set n=0
for %%a in (%servers%) do (
   set game[!n!]=%%a
   set /A n+=1
)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if "%servers%"=="" goto nosvr
echo Select a server
%MYFILES%\cmdmenusel 0870 %servers%
IF %ERRORLEVEL%==1 set ip=%game[0]%
IF %ERRORLEVEL%==2 set ip=%game[1]%
IF %ERRORLEVEL%==3 set ip=%game[2]%
IF %ERRORLEVEL%==4 set ip=%game[3]%
IF %ERRORLEVEL%==5 set ip=%game[4]%
IF %ERRORLEVEL%==6 set ip=%game[5]%
IF %ERRORLEVEL%==7 set ip=%game[6]%
IF %ERRORLEVEL%==8 set ip=%game[7]%
IF %ERRORLEVEL%==9 set ip=%game[8]%
IF %ERRORLEVEL%==10 set ip=%game[9]%
IF %ERRORLEVEL%==11 set ip=%game[10]%
IF %ERRORLEVEL%==12 set ip=%game[11]%
IF %ERRORLEVEL%==13 set ip=%game[12]%
IF %ERRORLEVEL%==14 set ip=%game[13]%
IF %ERRORLEVEL%==15 set ip=%game[14]%
IF %ERRORLEVEL%==16 set ip=%game[15]%
IF %ERRORLEVEL%==17 set ip=%game[16]%
IF %ERRORLEVEL%==18 set ip=%game[17]%
IF %ERRORLEVEL%==19 set ip=%game[18]%
IF %ERRORLEVEL%==20 set ip=%game[19]%
::I figured 20 servers would be enough
echo Please choose a client to connect with:
%MYFILES%\cmdmenusel 0870 "2009" "2010" "2011" "2013" "2014"
IF %ERRORLEVEL%==1 set year=2009
IF %ERRORLEVEL%==2 set year=2010
IF %ERRORLEVEL%==3 set year=2011
IF %ERRORLEVEL%==4 set year=2013
IF %ERRORLEVEL%==5 set year=2014
goto enterport
:nosvr
echo You do not have any saved servers, add one in settings^^!
ping localhost -n 3 >nul
goto settings

:addsvr
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
set n=0
for %%a in (%servers%) do (
   set game[!n!]=%%a
   set /A n+=1
)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p tmpsvr=Enter the IP of the server you want to save: 
if NOT "%game[19]%" == "" echo You've reached the max amount of saved servers.
if "%game[19]%" == "" set servers=%servers% %tmpsvr% && echo Server added^^!
ping localhost -n 3 >nul
goto settings

:credits
cls
%MYFILES%\FileDownloader.exe "http://66.78.126.165/IDE/Credits.txt" "%cd%\launcher\credits.txt"
%MYFILES%\insertbmp /p:%MYFILES%\bkg_credits.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
type %cd%\launcher\credits.txt
::Credits are downloaded from the website in order to give credit to anyone at any time
echo.
echo.
echo Press any key to go back. . .
pause >nul
goto main
:update
cls
%MYFILES%\insertbmp /p:%MYFILES%\bkg.bmp
echo Version %gmver%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. A new version of Eyche is available, do you want to download it?
%MYFILES%\cmdmenusel 0870 "Yes" "No :("
IF %ERRORLEVEL%==1 goto installupdt
Echo Please try to update again soon^^!
ping localhost -n 3 >nul
goto main
:installupdt
echo Please wait while the package downloads...
%MYFILES%\FileDownloader.exe "http://66.78.126.165/game/client.zip" "%cd%\launcher\pkg.ech"
start %cd%\launcher\updater.exe
exit