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
git commit -m "Deploy com domínio personalizado www.ssibrasil.xyz"

echo === Enviando para GitHub (force push) ===
git push -f origin main

echo === Concluído ===
pause
