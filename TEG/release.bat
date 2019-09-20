@ECHO off
CD ..
ECHO ===============
ECHO Building...
ECHO ===============
CMD /C bundler exec jekyll build
ECHO(
ECHO(
ECHO ===============
ECHO Releasing...
ECHO ===============
git pull
git add assets\images\
git add -u
git commit -m "Update artwork"
git push
ROBOCOPY _static\ _gh-pages\ /S
CD _gh-pages\
git pull
git add artwork\ albums\ assets\
git add -u
git commit -m "Update artwork"
git push
ECHO(
ECHO(
ECHO Done! Go to 'lewisgaul.github.io/artwork-site' to see the live site.
PAUSE
