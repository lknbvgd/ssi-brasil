@echo off
:: Configurações iniciais
set REPO_NAME=ssi-integrado
set COMMIT_MSG=Deploy automatico SSI integrado
set GITHUB_USER=seu-usuario
set GITHUB_EMAIL=seu-email@example.com

:: Inicializa o Git (se necessário)
IF NOT EXIST .git (
    git init
    git config user.name "%GITHUB_USER%"
    git config user.email "%GITHUB_EMAIL%"
)

:: Adiciona os arquivos
git add .
git commit -m "%COMMIT_MSG%"

:: Define a branch principal
git branch -M main

:: Cria e sobe para o repositório remoto (lembre de substituir a URL abaixo pela sua)
git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git
git push -u origin main

:: Inicia o deploy no Vercel (caso tenha Vercel CLI instalado)
vercel --prod
