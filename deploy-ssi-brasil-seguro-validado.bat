@echo off
setlocal enabledelayedexpansion

echo Verificando pasta atual...
set "current_dir=%cd%"
echo Local atual: %current_dir%

:: Checar se está sendo executado em C:\Windows\System32
echo %current_dir% | findstr /i "C:\\Windows\\System32" > nul
if %errorlevel%==0 (
    echo ERRO: Este script nao deve ser executado dentro de C:\Windows\System32.
    echo Por favor, mova o script para a pasta correta do seu projeto e execute novamente.
    pause
    exit /b
)

:: Etapa 1: Inicializar repositório Git
echo === Inicializando repositório Git ===
git init

:: Etapa 2: Adicionar arquivos
echo === Adicionando arquivos ===
git add .

:: Etapa 3: Commitar alterações
echo === Commitando alteracoes ===
git commit -m "Deploy automático do projeto SSI BRASIL"

:: Etapa 4: Adicionar origem remota (altere se necessário)
echo === Adicionando origem remota ===
git remote remove origin
git remote add origin https://github.com/SSIBRASIL/SSI-BRASIL.git

:: Etapa 5: Forçar push para o GitHub
echo === Enviando para GitHub ===
git push -u origin main --force

:: Etapa 6: Deploy com Vercel
echo === Fazendo deploy com Vercel ===
vercel --prod

echo === Concluído ===
pause
