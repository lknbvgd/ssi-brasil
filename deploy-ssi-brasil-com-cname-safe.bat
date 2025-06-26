@echo off
setlocal

:: Verifica se o script está sendo executado em uma pasta segura (fora de System32)
cd > current_dir.txt
set /p CURRENT_DIR=<current_dir.txt
del current_dir.txt

echo === Verificando diretório atual ===
echo Diretório: %CURRENT_DIR%

echo %CURRENT_DIR% | findstr /I "System32" > nul
if %errorlevel%==0 (
    echo ERRO: Você está tentando executar o script a partir da pasta System32 (protegida).
    echo Por favor, mova o projeto e o script para uma pasta comum como Documentos ou Desktop.
    pause
    exit /b
)

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

echo === Concluído com sucesso! ===
pause
