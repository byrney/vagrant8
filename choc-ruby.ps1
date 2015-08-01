

start-process -wait -verb runas cinst ruby -version 2.1.6
start-process -wait -verb runas cinst ruby2.devkit
start-process -wait -verb runas cinst rubygems -version 2.4.1.0

# workaround for missing certs in ruby prior to 2.4
echo f | xcopy /i /d \vagrant\AddTrustExternalCARoot-2048.pem c:\tools\ruby21\lib\ruby\site_ruby\2.1.0\rubygems\ssl_certs\
#gem source -a http://rubygems.org
gem install bundler
