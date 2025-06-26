@echo off
title Deploy Automático SSI BRASIL
echo Verificando pasta atual...
setlocal
set "CURRENT_DIR=%cd%"
echo Local atual: %CURRENT_DIR%

:: Verifica se estamos executando dentro da pasta System32
echo %CURRENT_DIR% | findstr /C:"System32" >nul
if %errorlevel%==0 (
    echo ERRO: Este script nao deve ser executado dentro de C:\Windows\System32.
    echo Por favor, mova o script para a pasta correta do seu projeto e execute novamente.
    pause
    exit /b
)

:: Adiciona arquivos
echo === Adicionando arquivos ===
git add .

:: Faz commit
echo === Commitando alteracoes ===
git commit -m "Deploy automático atualizado do projeto SSI BRASIL"

:: Envia para GitHub
echo === Enviando para GitHub ===
git push origin main --force

:: Deploy Vercel
echo === Fazendo deploy com Vercel ===
vercel --prod

echo === Concluído ===
pause
