
chocolatey feature enable -n allowGlobalConfirmation

start-process -wait -verb runas cinst ruby
start-process -wait -verb runas cinst ruby2.devkit 
start-process -wait -verb runas cinst rubygems

# workaround for missing certs in ruby prior to 2.4
xcopy /d \vagrant\AddTrustExternalCARoot-2048.pem c:\tools\ruby215\lib\ruby\site_ruby\2.1.0\rubygems\ssl_certs
gem source -a http://rubygems.org

