@echo off
setlocal

:: CONFIGURAÇÕES
set REPO_URL=https://github.com/SSIBRASIL/ssi-brasil.git
set BRANCH=main
set COMMIT_MSG=Deploy direto SSI BRASIL

cd /d "%~dp0"

echo === Verificando se repositório Git está iniciado ===
IF NOT EXIST ".git" (
    echo === Inicializando repositório Git ===
    git init
)

echo === Adicionando arquivos ===
git add .
git commit -m "%COMMIT_MSG%" >nul 2>&1

echo === Configurando remoto ===
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
git branch -M %BRANCH%

echo === Enviando para GitHub ===
git push -u origin %BRANCH% --force

echo === Fazendo deploy na Vercel ===
vercel --prod --yes

echo === Processo concluído com sucesso ===
