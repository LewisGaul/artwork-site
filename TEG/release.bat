@ECHO off
CD ..

ECHO ===============
ECHO Updating...
ECHO ===============
:: Ensure we pick up any new assets (for the stash).
git add assets\
:: Encourage pull to succeed.
git pull --rebase --autostash

ECHO(
ECHO(

ECHO ===============
ECHO Building...
ECHO ===============
CMD /C bundler exec jekyll build

ECHO(
ECHO(

ECHO ===============
ECHO Releasing...
ECHO ===============
:: Main branch update.
git commit -am "Update artwork"
git push

:: gh-pages release update. Uses a copy of the git repo on the gh-pages branch.
CD _gh-pages\
git pull
RMDIR artwork\ albums\ assets\ /S /Q
ROBOCOPY ..\_static\ . /S
git add artwork\ albums\ assets\
git commit -am "Update artwork"
git push

ECHO(
ECHO(
ECHO Done! Go to 'lewisgaul.github.io/artwork-site' to see the live site.
ECHO(
PAUSE
