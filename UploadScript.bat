@echo off
setlocal enabledelayedexpansion

mode con: cols=75 lines=25
color 0A

:: التحقق من وجود curl
where curl >nul 2>nul
if errorlevel 1 (
    echo curl is not installed. Please install curl to use this script.
    endlocal
    pause >nul
    exit /b
)

:Tamorot
:: عرض الرسالة الترحيبية
echo.
echo.
echo 	"	 _____                               _   	"
echo 	"	|_   _|_ _ _ __ ___   ___  _ __ ___ | |_ 	"
echo 	"	  | |/ _` | '_ ` _ \ / _ \| '__/ _ \| __|	"
echo 	"	  | | (_| | | | | | | (_) | | | (_) | |_ 	"
echo 	"	  |_|\__,_|_| |_| |_|\___/|_|  \___/ \__|	"
echo.
echo 		   "Welcome to Text And Image Uploader!"
echo.
echo.

:: طلب من المستخدم تحديد نوع المحتوى الذي يريد رفعه
echo Select the type of content you want to upload:
echo.
echo - 1: upload text
echo - 2: upload image
echo.
set /p choice=Enter your choice (1 or 2): 
echo.
if "%choice%"=="1" (
    goto upload_text
) else if "%choice%"=="2" (
    goto upload_image
) else (
    echo Invalid choice. Please run the script again and select a valid option.
    endlocal
    pause >nul
    goto Tamorot
)

:upload_text
:: طلب النص الذي يريد المستخدم رفعه
set /p text=Enter the text you want to upload: 

:: إنشاء ملف مؤقت يحتوي على النص
set temp_file=temp.txt
echo %text% > %temp_file%

:: رفع الملف إلى 0x0.st والحصول على الرابط
for /f "tokens=*" %%i in ('curl -F "file=@%temp_file%" http://0x0.st') do (
    set url=%%i
)

:: عرض الرابط
cls
mode con: cols=75 lines=15
color 0A
echo.
echo.
echo 	"	 _____                               _   	"
echo 	"	|_   _|_ _ _ __ ___   ___  _ __ ___ | |_ 	"
echo 	"	  | |/ _` | '_ ` _ \ / _ \| '__/ _ \| __|	"
echo 	"	  | | (_| | | | | | | (_) | | | (_) | |_ 	"
echo 	"	  |_|\__,_|_| |_| |_|\___/|_|  \___/ \__|	"
echo.
echo 		   "Welcome to Text And Image Uploader!"
echo.
echo.
echo Text uploaded successfully. Access it at: %url%
echo.
echo.
:: حذف الملف المؤقت
if exist "%temp_file%" (
    del "%temp_file%"
)

endlocal
pause >nul
goto Tamorot

:upload_image
:: طلب مسار الملف الذي يريد المستخدم رفعه
set /p file_path=Enter the path of the file you want to upload: 

:: التحقق من وجود الملف
if not exist "%file_path%" (
	echo.
    echo File not found. Click ENTER and try again.
    endlocal
    pause >nul
    goto Tamorot
)

:: رفع الملف إلى 0x0.st والحصول على الرابط
for /f "tokens=*" %%i in ('curl -F "file=@%file_path%" http://0x0.st') do (
    set url=%%i
)

:: عرض الرابط
cls
mode con: cols=75 lines=15
color 0A
echo.
echo.
echo 	"	 _____                               _   	"
echo 	"	|_   _|_ _ _ __ ___   ___  _ __ ___ | |_ 	"
echo 	"	  | |/ _` | '_ ` _ \ / _ \| '__/ _ \| __|	"
echo 	"	  | | (_| | | | | | | (_) | | | (_) | |_ 	"
echo 	"	  |_|\__,_|_| |_| |_|\___/|_|  \___/ \__|	"
echo.
echo 		   "Welcome to Text And Image Uploader!"
echo.
echo.
echo File uploaded successfully. Access it at: %url%
echo.
echo.
endlocal
pause >nul
goto Tamorot