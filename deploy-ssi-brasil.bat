@echo off
echo === Inicializando repositório Git ===
git init

echo === Adicionando origem remota ===
git remote add origin https://github.com/SSIBRASIL/SSI-BRASIL.git

echo === Alterando branch para main ===
git branch -M main

echo === Adicionando arquivos ===
git add .

echo === Commitando alterações ===
git commit -m "Deploy atualizado do site SSI BRASIL"

echo === Enviando para GitHub ===
git push -f origin main

echo === Fazendo deploy com Vercel ===
vercel --prod

echo === Concluído ===
pause
