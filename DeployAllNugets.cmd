@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set ROOTPATH=%cd%
set BIN_FOLDER=bin\Debug
set PACKAGES_SERVER=\\devci3-tv\Packages

set PROJECT_NAME=
set LAST=

for /d %%d in (*.*) do (
echo %%d
set PROJECT_NAME=%%d
cd %ROOTPATH%
cd %%d
cd %BIN_FOLDER%
	for /f %%i in ('dir /b/a-d/od/t:c') do set last=%%i
	echo The most recently created file is !last!
	nuget add %ROOTPATH%\!PROJECT_NAME!\%BIN_FOLDER%\!last! -Source %PACKAGES_SERVER%
	set last=
)

pause

