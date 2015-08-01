set PATH=%PATH%;c:\Program Files\Git\bin
set HOME=c:\Users\vagrant
cd %HOME%
if not exist %HOME%\Config\NUL goto clone

cd %HOME%\Config
git pull
 
goto install

:clone
REM git clone https://github.com/ngallo/BoxConfig.git
REM cd BoxConfig
git clone https://github.com/byrney/Config.git
cd Config

:install

bash install.sh ngallo.cfg
