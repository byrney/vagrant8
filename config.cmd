@echo off
set PATH=%PATH%;c:\Program Files\Git\bin
set HOME=c:\Users\vagrant
cd %HOME%
if not exist %HOME%\Config\NUL goto clone

cd %HOME%\Config
git pull

goto install

:clone
git clone https://github.com/byrney/Config.git
cd Config

:install

bash install.sh rob.cfg

