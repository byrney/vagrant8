@echo off

if [%1]==[] goto missingargs
if [%2]==[] goto missingargs
if [%3]==[] goto missingargs


set PATH=%PATH%;c:\Program Files\Git\bin
set HOME=c:\Users\%1
if not exist %HOME%\Config\NUL goto clone

cd %HOME%\Config
git pull

goto install

:clone
cd %HOME%
git clone https://github.com/%2/Config.git
cd Config

:install

bash install.sh %3.cfg

goto done

:missingargs

echo "arguments missing.   config.cmd  guest-user   github-user"

:done
