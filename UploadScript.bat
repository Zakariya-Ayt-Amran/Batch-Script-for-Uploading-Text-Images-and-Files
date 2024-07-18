@echo off
setlocal enabledelayedexpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

mode con: cols=64 lines=20
color 0A

:: Checking for curl installation

where curl >nul 2>nul
if errorlevel 1 (
    echo curl is not installed. Please install curl to use this script.
    endlocal
    pause >nul
    exit /b
)

:TAMOROT

:: Display welcome message

cls
echo.
echo.
echo       "    _____                               _   	"
echo       "   |_   _|_ _ _ __ ___   ___  _ __ ___ | |_ 	"
echo       "     | |/ _` | '_ ` _ \ / _ \| '__/ _ \| __|	"
echo       "     | | (_| | | | | | | (_) | | | (_) | |_ 	"
echo       "     |_|\__,_|_| |_| |_|\___/|_|  \___/ \__|	"
echo.
call :ColorText 0f "               Welcome to Text And File Uploader!" & echo;
echo.
echo.

:: Prompt the user to select the type of content to upload

echo Select the type of content you want to upload:
echo.
call :ColorText 0f "-"& call :ColorText 0C "1"& call :ColorText 0b ")"& call :ColorText 0F "upload text" & echo;
call :ColorText 0f "-"& call :ColorText 0C "2"& call :ColorText 0b ")"& call :ColorText 0F "upload image"& echo;
call :ColorText 0f "-"& call :ColorText 0C "3"& call :ColorText 0b ")"& call :ColorText 0F "upload other file types ("& call :ColorText 0e "e.g., .txt, .pdf, .docx...)" & echo;
echo.
set /p choice=Enter your choice (1, 2, or 3): 
echo.

if "%choice%"=="1" (
    goto upload_text
) else if "%choice%"=="2" (
    goto upload_image
) else if "%choice%"=="3" (
    goto upload_file
) else (
    echo Invalid choice. Click ENTER and select a valid option.
    endlocal
    pause >nul
    goto TAMOROT
)

:upload_text
cls
mode con: cols=100 lines=14
color 0A
echo.
echo.
echo 			"		 _____ _______  _______ 		"
echo 			"		|_   _| ____\ \/ /_   _|		"
echo 			"		  | | |  _|  \  /  | |  		"
echo 			"		  | | | |___ /  \  | |  		"
echo 			"		  |_| |_____/_/\_\ |_|  		"
echo.
call :ColorText 0f "                                    Write the text you want to upload!" & echo;
echo.
echo.

:: Prompt the user to enter the text they want to upload
call :ColorText 0f "Enter the text you want to upload"
set /p text= : 
echo.

:: Create a temporary file with the entered text

set temp_file=temp.txt
echo %text% > %temp_file%

:: Upload the file to 0x0.st and retrieve the URL

for /f "tokens=*" %%i in ('curl -F "file=@%temp_file%" http://0x0.st') do (
    set url=%%i
)

:: Display the URL
cls
mode con: cols=66 lines=13
color 0A
echo.
echo.
echo 	"		 _   _ ____  _     		"
echo 	"		| | | |  _ \| |    		"
echo 	"		| | | | |_) | |    		"
echo 	"		| |_| |  _ <| |___ 		"
echo 	"		 \___/|_| \_\_____|		"
echo.
call :ColorText 0f "                 Welcome to Text And File Uploader!" & echo;
echo.
echo.
call :ColorText 0f "Text uploaded successfully. URL"
echo : %url%
echo.

:: Delete the temporary file

if exist "%temp_file%" (
    del "%temp_file%"
)

endlocal
pause >nul
goto TAMOROT

:upload_image
cls
mode con: cols=100 lines=14
color 0A
echo.
echo.
echo 			"	 ___                            	"
echo 			"	|_ _|_ __ ___   __ _  __ _  ___ 	"
echo 			"	 | || '_ ` _ \ / _` |/ _` |/ _ \	"
echo 			"	 | || | | | | | (_| | (_| |  __/	"
echo 			"	|___|_| |_| |_|\__,_|\__, |\___|	"
echo 			"	                     |___/      	"
echo.
call :ColorText 0f "                           You can upload any image " & call :ColorText 0b " with any extension!" & echo;
echo.
echo.

:: Prompt the user to enter the path of the image they want to upload
call :ColorText 0f "Enter the path of the Image you want to upload"
set /p file_path= : 
echo.

:: Check if the file exists

if not exist "%file_path%" (
	echo.
    echo File not found. Click ENTER and try again.
    endlocal
    pause >nul
    goto TAMOROT
)

:: Upload the file to 0x0.st and retrieve the URL

for /f "tokens=*" %%i in ('curl -F "file=@%file_path%" http://0x0.st') do (
    set url=%%i
)

:: Display the URL

cls
mode con: cols=66 lines=13
color 0A
echo.
echo.
echo 	"		 _   _ ____  _     		"
echo 	"		| | | |  _ \| |    		"
echo 	"		| | | | |_) | |    		"
echo 	"		| |_| |  _ <| |___ 		"
echo 	"		 \___/|_| \_\_____|		"
echo.
call :ColorText 0f "                 Welcome to Text And File Uploader!" & echo;
echo.
echo.
call :ColorText 0f "Image uploaded successfully. URL"
echo : %url%
echo.

endlocal
pause >nul
goto TAMOROT

:upload_file
cls
mode con: cols=100 lines=14
color 0A
echo.
echo.
echo 			"		 _____ ___ _     _____ 			"
echo 			"		|  ___|_ _| |   | ____|			"
echo 			"		| |_   | || |   |  _|  			"
echo 			"		|  _|  | || |___| |___ 			"
echo 			"		|_|   |___|_____|_____|			"
echo.
call :ColorText 0f "                             File types" & call :ColorText 0c " .exe, .rar," & call :ColorText 0a " and " & call :ColorText 0c " .jar" & call :ColorText 0f " are not allowed!" & echo;
echo.
echo.

:: Prompt the user to enter the path of the file they want to upload
call :ColorText 0f "Enter path the file"& call :ColorText 0e " (e.g., .txt, .pdf, .docx...)"
set /p file_path= : 
echo.

:: Check if the file exists

if not exist "%file_path%" (
    echo File not found. Click ENTER and try again.
    endlocal
    pause >nul
    goto TAMOROT
)

:: Check if the file type is allowed

call :check_file_type "%file_path%"
if errorlevel 1 (
    echo File type not allowed. Click ENTER and try again.
    endlocal
    pause >nul
    goto TAMOROT
)

:: Upload the file to 0x0.st and retrieve the URL

for /f "tokens=*" %%i in ('curl -F "file=@%file_path%" http://0x0.st') do (
    set url=%%i
)

if "%url%"=="" (
    echo Failed to upload the file. Please try again.
    endlocal
    pause >nul
    goto TAMOROT
)

:: Display the URL

cls
mode con: cols=66 lines=13
color 0A
echo.
echo.
echo 	"		 _   _ ____  _     		"
echo 	"		| | | |  _ \| |    		"
echo 	"		| | | | |_) | |    		"
echo 	"		| |_| |  _ <| |___ 		"
echo 	"		 \___/|_| \_\_____|		"
echo.
call :ColorText 0f "                 Welcome to Text And File Uploader!" & echo;
echo.
echo.
call :ColorText 0f "File uploaded successfully. URL"
echo : %url%
echo.

endlocal
pause >nul
goto TAMOROT

:check_file_type

:: Check if the file type is allowed

set "file_path=%~1"
set "allowed_extensions=pdf docx txt jpg jpeg png gif bmp dat"

:: Extract file extension

for %%A in ("%file_path%") do set "file_ext=%%~xA"
set "file_ext=%file_ext:~1%"

:: Check if the extension is allowed

set "is_valid=0"
for %%x in (%allowed_extensions%) do (
    if /i "%file_ext%"=="%%x" (
        set "is_valid=1"
        goto :break
    )
)
:break

if "%is_valid%"=="1" (
    exit /b 0
) else (
    exit /b 1
)

goto :Beginoffile

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:Beginoffile
