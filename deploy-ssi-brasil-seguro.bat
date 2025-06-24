@echo off
setlocal enabledelayedexpansion

:: Verifica se o script está sendo executado na pasta System32 (evita erros e riscos)
cd > path.txt
set /p current_path=<path.txt
del path.txt

echo Verificando pasta atual...
echo Local atual: %current_path%
echo.

echo %current_path% | findstr /I "System32" >nul
if %errorlevel%==0 (
    echo ERRO: Você está tentando executar o script dentro da pasta protegida System32!
    echo Por segurança, mova os arquivos para outra pasta (como sua Área de Trabalho) e execute novamente.
    pause
    exit /b
)

echo === Inicializando repositório Git ===
git init

echo === Adicionando origem remota ===
git remote remove origin 2>nul
git remote add origin https://github.com/SSIBRASIL/SSI-BRASIL.git

echo === Alterando branch para main ===
git checkout -B main

echo === Adicionando arquivos ===
git add .

echo === Commitando alterações ===
git commit -m "Deploy automático do site SSI BRASIL com segurança"

echo === Enviando para GitHub (forçado) ===
git push -u origin main --force

echo === Fazendo deploy com Vercel ===
vercel --prod

echo === Processo concluído com sucesso ===
pause
