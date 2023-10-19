@echo off
color 4
echo HIL.Corp
echo WARNING This application only runs on x64 bit systems, x32 or x86 are not compatible:
for /f "tokens=2 delims==" %%G in ('wmic os get osarchitecture /value ^| find "="') do set "arch=%%G"

if "%arch%"=="64-bit" (
    set "arch_msg=64-Bit"
) else (
    set "arch_msg=32-Bit oder 86-Bit (x86)"
)

echo Your computer is running on  %arch_msg%
if "%arch%"=="64-bit" (
    echo 1] Run application
    echo 2] Exit
    choice /c 12 /n /m "Wahlen Sie eine Option: "
    if errorlevel 2 (
        exit
    ) else if errorlevel 1 (
        start D:/Windows/tool
        start homepage.bat
    )
) else (
    echo Ihr Computer hat eine 32-Bit-Architektur und kann diese Anwendung nicht ausführen.
    pause
    exit
)
