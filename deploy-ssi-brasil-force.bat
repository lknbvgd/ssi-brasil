
@echo off
setlocal

:: Nome do projeto
set REPO=SSI-BRASIL

:: Diretório onde está o projeto
cd /d "%~dp0"

echo.
echo === Inicializando repositório Git ===
git init
git remote remove origin 2>nul
git remote add origin https://github.com/ssibrasil/SSI-BRASIL.git

echo.
echo === Adicionando arquivos ===
git add .
git commit -m "Deploy automático do site SSI BRASIL"
git branch -M main
git push -u origin main --force

echo.
echo === Fazendo deploy com Vercel ===
vercel --prod

echo.
echo === Deploy finalizado! Pressione qualquer tecla para sair. ===
pause
