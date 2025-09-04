@echo off
echo Iniciando Appium Server...
echo.

REM Verificar se o Node.js está instalado
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERRO: Node.js nao esta instalado!
    echo Instale o Node.js de: https://nodejs.org/
    pause
    exit /b 1
)

REM Verificar se o Appium está instalado
appium --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando Appium...
    npm install -g appium
)

REM Verificar se o driver UiAutomator2 está instalado
appium driver list | findstr uiautomator2 >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando driver UiAutomator2...
    appium driver install uiautomator2
)

echo.
echo Iniciando Appium Server na porta 4723...
echo Pressione Ctrl+C para parar o servidor
echo.

REM Iniciar Appium Server
appium --config appium-config.json

pause
