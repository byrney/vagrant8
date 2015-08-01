@echo off

if [%1]==[] goto missingargs
if [%2]==[] goto missingargs
if [%3]==[] goto missingargs
if [%4]==[] goto missingargs


set PATH=%PATH%;c:\Program Files\Git\bin
set HOME=c:\Users\%1
if not exist %HOME%\%3\NUL goto clone

cd %HOME%\%3
git pull

goto install

:clone
cd %HOME%
git clone https://github.com/%2/%3.git
cd %3

:install

bash install.sh %4.cfg

goto done

:missingargs

echo "arguments missing.   config.cmd  guest-user   github-user repo-name cfg-name"

:done
