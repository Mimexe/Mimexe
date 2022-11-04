@ECHO OFF
echo Initiating git...
start /wait cmd /c "git init"
echo Initiating npm...
start /wait cmd /c "npm init -y"
echo Modifying package.json
start /wait cmd /c "code ./package.json --wait"
echo Creating index.js
start /wait cmd /c "echo // index.js > index.js"
echo Setting the git remote
set /p url="> "
start /wait cmd /c "git remote add origin %url%"
echo Creating MIT Licenese
start /wait cmd /c "curl -o LICENSE https://raw.githubusercontent.com/Mimexe/Mimexe/main/default.license"
type LICENSE
echo Creating README.md
start /wait cmd /c "echo # CommandesBot > README.md"
start /wait cmd /c "echo. >> README.md"
echo Creating gitignore
start /wait cmd /c "curl -o .gitignore https://raw.githubusercontent.com/Mimexe/Mimexe/main/default.gitignore"
type .gitignore
echo Commiting with git
start /wait cmd /c "git add ."
start /wait cmd /c "git commit -a -m 'Initial'"
start /wait cmd /c "git branch -M main"
start /wait cmd /c "git push -u origin main"
echo Opening VSCODE
start /wait cmd /c "code ."