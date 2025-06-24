@echo off
:: === DEPLOY SSI BRASIL AUTOMÁTICO ===
title Deploy SSI BRASIL

:: Exibe o diretório atual
echo Verificando pasta atual...
cd
echo.

:: Inicializa o repositório Git se ainda não existir
if not exist .git (
    echo === Inicializando repositório Git ===
    git init
)

:: Adiciona todos os arquivos
echo === Adicionando arquivos ===
git add .

:: Faz commit das alterações
echo === Commitando alterações ===
git commit -m "Deploy automático do site SSI BRASIL - 24/06/2025 06:13:31"

:: Adiciona ou força origem remota do GitHub
echo === Adicionando origem remota ===
git remote remove origin 2>nul
git remote add origin https://github.com/SSIBRASIL/ssi-brasil.git

:: Envia para o GitHub com force push
echo === Enviando para GitHub ===
git push -u origin main --force

:: Faz o deploy no Vercel
echo.
echo === Fazendo deploy com Vercel ===
vercel --prod

echo.
echo === DEPLOY CONCLUÍDO ===
pause
