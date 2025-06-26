@echo off
echo === Atualizando repositório local com 'git pull --rebase' ===
git pull --rebase origin main

echo === Adicionando README.md ===
git add README.md

echo === Commitando alterações ===
git commit -m "Adiciona README com instruções de uso e deploy"

echo === Enviando para GitHub ===
git push

echo === README.md enviado com sucesso após rebase ===
pause
