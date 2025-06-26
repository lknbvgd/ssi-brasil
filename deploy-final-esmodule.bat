@echo off
echo === CONFIGURANDO GIT (caso ainda não tenha) ===
git config --global user.name "Lucas"
git config --global user.email "lucas@email.com"

echo === ADICIONANDO ARQUIVOS ===
git add .

echo === COMMITANDO ALTERAÇÕES ===
git commit -m "Deploy final com ESModules e Supabase seguro"

echo === ENVIANDO PARA GITHUB ===
git push origin main

echo === FAZENDO DEPLOY NA VERCEL ===
vercel --prod --confirm

pause
