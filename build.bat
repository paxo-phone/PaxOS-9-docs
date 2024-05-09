:: Created by Charles Mahoudeau
:: 10/05/2024

@ECHO off

:: Check if asciidoctor is installed
WHERE /q asciidoctor
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error : Asciidoctor is not installed !
    TIMEOUT /t 2 /nobreak > nul
    GOTO :eof
)

:: Clear previous build
IF EXIST output (
    RMDIR /s /q output
)

:: Build and output
CALL asciidoctor src/api-reference.adoc
MKDIR output
MOVE /y .\src\api-reference.html .\output\index.html > nul
XCOPY /e /k /h /i .\src\images .\output\images > nul

:: Info
ECHO Build done.
ECHO Output : %cd%\output\index.html

TIMEOUT /t 2 > nul

:eof