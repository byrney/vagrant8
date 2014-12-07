
start-process -wait -verb runas cinst ruby
start-process -wait -verb runas cinst ruby2.devkit 
start-process -wait -verb runas cinst rubygems

# workaround for missing certs in ruby prior to 2.4
copy \vagrant\AddTrustExternalCARoot-2048.pem c:\tools\ruby213\lib\ruby\site_ruby\2.1.0\rubygems\ssl_certs

