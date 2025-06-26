@echo off
echo === Adicionando README.md ao projeto ===
git add README.md

echo === Commitando README.md ===
git commit -m "Adiciona README com instruções de uso e deploy"

echo === Enviando para GitHub ===
git push

echo === README.md enviado com sucesso! ===
pause
