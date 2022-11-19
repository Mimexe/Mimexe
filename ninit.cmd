@ECHO OFF
cls
echo Initiating...
echo Initiating git...
start /wait cmd /c "git init"
echo Initiating npm...
start /wait cmd /c "npm init -y"
echo Modifying package.json
start /wait cmd /c "echo Modify package.json and close VSCode && code ./package.json --wait"
echo Creating index.js
start /wait cmd /c "echo // index.js > index.js"
echo Setting the git remote
set /p url="> "
start /wait cmd /c "git remote add origin %url%"
echo Creating MIT Licenese
start /wait cmd /c "curl -o LICENSE https://raw.githubusercontent.com/Mimexe/Mimexe/main/default.license"
type LICENSE
echo Creating README.md
for %%I in (.) do set CurrDirName=%%~nxI
echo Current Folder Name: %CurrDirName%
start /wait cmd /c "echo # %CurrDirName% > README.md"
start /wait cmd /c "echo. >> README.md"
echo Creating gitignore
start /wait cmd /c "curl -o .gitignore https://raw.githubusercontent.com/Mimexe/Mimexe/main/default.gitignore"
type .gitignore
echo Commiting with git
start /wait cmd /c "git add ."
start /wait cmd /c "git commit -a -m 'Initial'"
start /wait cmd /c "git branch -M main"
start /wait cmd /c "git push -u origin main"
start /wait cmd /c "git push --set-upstream origin main"
start /wait cmd /c "git branch --set-upstream-to=origin/main main"
start /wait cmd /c "git pull"
echo Initialized!
