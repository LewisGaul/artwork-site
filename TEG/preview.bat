@ECHO off
CD ..

ECHO Running...
:: Pull in any remote changes.
git pull --rebase --autostash >NUL 2>&1
:: Run jekyll serve in the background, waiting a few seconds for it to complete.
START /B CMD /C CALL bundler exec jekyll serve --baseurl "" --destination _tmp-static >NUL 2>&1
TIMEOUT /t 3 ::>NUL 2>&1

ECHO(
ECHO Hello Tamsin!
ECHO Enter 'localhost:4000' in the search bar of a web browser to preview the website.
ECHO Opening in your default browser now...
explorer "http://localhost:4000"
ECHO(
ECHO When you're finished, just close this window. Don't forget to run 'release'!
::PAUSE