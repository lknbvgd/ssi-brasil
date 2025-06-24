@echo off
setlocal

echo Verificando pasta atual...
cd /d "%~dp0"
set "CURR_DIR=%cd%"
echo Local atual: %CURR_DIR%

:: Evitar execução dentro do diretório do Windows
echo %CURR_DIR% | find /i "C:\Windows\System32" >nul
if %errorlevel%==0 (
    echo.
    echo ERRO: Este script nao deve ser executado dentro de C:\Windows\System32.
    echo Por favor, mova o script para a pasta correta do seu projeto e execute novamente.
    pause
    exit /b
)

echo.
echo === Adicionando arquivos ===
git add .

echo.
echo === Commitando alteracoes ===
git commit -m "Deploy seguro automatizado do projeto SSI BRASIL"

echo.
echo === Enviando para GitHub ===
git push origin master

echo.
echo === Fazendo deploy com Vercel ===
vercel --prod

echo.
echo === Concluido ===
pause
endlocal
