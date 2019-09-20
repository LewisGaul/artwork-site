@ECHO on
@CD ..

(
@ECHO Running...
:: Clean the _static dir as it is about to be updated anyway.
git checkout _static
git clean _static -fd
:: Pull in any remote changes.
git pull --rebase --autostash
bundler exec jekyll build -V
) >TEG\debug.log 2>&1
