@ECHO off
CD ..
ECHO Running...
START /B /WAIT CMD /C CALL bundler exec jekyll serve >NUL 2>&1
ECHO(
ECHO Hello Tamsin!
ECHO Enter 'localhost:4000' in a web browser to preview the website.
ECHO(
ECHO When you're finished, just close this window. Don't forget to run 'release'!
::PAUSE