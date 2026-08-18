@echo off
setlocal
title INTEGRA Launcher
cd /d "%~dp0"

set "INTEGRA_PYTHON=.venv\Scripts\python.exe"
set "INTEGRA_CODEX_PYTHON=C:\Users\Asgar\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"

if not exist "%INTEGRA_PYTHON%" (
    echo Setting up INTEGRA for the first time...

    where py >nul 2>nul
    if not errorlevel 1 (
        py -m venv .venv
    ) else if exist "%INTEGRA_CODEX_PYTHON%" (
        "%INTEGRA_CODEX_PYTHON%" -m venv .venv
    ) else (
        where python >nul 2>nul
        if errorlevel 1 (
            echo.
            echo Python was not found. Install Python 3.10 or newer, then run this shortcut again.
            echo Download: https://www.python.org/downloads/
            pause
            exit /b 1
        )
        python -m venv .venv
    )

    if errorlevel 1 (
        echo.
        echo The Python environment could not be created.
        pause
        exit /b 1
    )
)

"%INTEGRA_PYTHON%" -c "import flask" >nul 2>nul
if errorlevel 1 (
    echo Installing the required package...
    "%INTEGRA_PYTHON%" -m pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo Flask could not be installed. Check your internet connection and try again.
        pause
        exit /b 1
    )
)

powershell -NoProfile -Command "try { $response = Invoke-WebRequest -UseBasicParsing -Uri 'http://127.0.0.1:3000/api/health' -TimeoutSec 1; if ($response.StatusCode -eq 200) { exit 0 }; exit 1 } catch { exit 1 }"
if not errorlevel 1 (
    echo INTEGRA is already running. Opening it now...
    start "" "http://localhost:3000"
    exit /b 0
)

echo Starting INTEGRA at http://localhost:3000
start "" powershell -NoProfile -WindowStyle Hidden -Command "$uri = 'http://localhost:3000'; for ($attempt = 0; $attempt -lt 30; $attempt++) { try { $null = Invoke-WebRequest -UseBasicParsing -Uri $uri -TimeoutSec 1; Start-Process $uri; exit } catch { Start-Sleep -Milliseconds 500 } }"
"%INTEGRA_PYTHON%" app.py

echo.
echo INTEGRA has stopped.
pause
