@echo off
setlocal enabledelayedexpansion

echo Verificando pasta atual...
cd /d "%~dp0"
set "PASTA_ATUAL=%cd%"
echo Local atual: %PASTA_ATUAL%

:: Impede execução em diretórios perigosos como C:\Windows\System32
echo %PASTA_ATUAL% | find /I "System32" >nul
if %errorlevel%==0 (
    echo.
    echo ERRO: Este script nao deve ser executado dentro de C:\Windows\System32.
    echo Por favor, mova o script para a pasta correta do seu projeto e execute novamente.
    pause
    exit /b
)

:: Inicializa repositório Git, se necessário
if not exist ".git" (
    echo === Inicializando repositório Git ===
    git init
)

:: Adiciona arquivos
echo === Adicionando arquivos ===
git add .

:: Faz commit
echo === Commitando alterações ===
git commit -m "Deploy seguro automatizado do projeto SSI BRASIL" || echo Nada a commitar

:: Adiciona origem remota se necessário
git remote -v | findstr /C:"https://github.com/SSIBRASIL/SSI-BRASIL.git" >nul
if errorlevel 1 (
    echo === Adicionando origem remota ===
    git remote add origin https://github.com/SSIBRASIL/SSI-BRASIL.git
)

:: Força envio para GitHub
echo === Enviando para GitHub ===
git push origin main --force

:: Faz deploy no Vercel
echo.
echo === Fazendo deploy com Vercel ===
vercel --prod

echo.
echo === Script finalizado com sucesso ===
pause
