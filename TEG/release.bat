ECHO on
CD ..
ECHO Building...
bundler exec jekyll build --baseurl artwork-site
ECHO Releasing...
git add assets\images\
echo git commit -am "Update artwork"
git push
ROBOCOPY _static\ gh-pages\ /S
CD _gh-pages\
git add artwork\ albums\ assets\
echo git commit -am "Update artwork"
git push
ECHO(
ECHO Done! Go to 'lewisgaul.github.io/artwork-site' to see the live site.
PAUSE
