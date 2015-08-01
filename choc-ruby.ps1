."c:\vagrant\utils.ps1"
	
Print 'Running choc-ruby.ps1'

# Step 1: Install Ruby
Call 'Step 1: Install Ruby' { 
        start-process -wait -verb runas cinst ruby
		start-process -wait -verb runas cinst ruby2.devkit 
		start-process -wait -verb runas cinst rubygems
		
		# workaround for missing certs in ruby prior to 2.4
		echo f | xcopy c:\vagrant\AddTrustExternalCARoot-2048.pem c:\tools\ruby215\lib\ruby\site_ruby\2.1.0\rubygems\ssl_certs
		gem source -a http://rubygems.org
    }

Print 'Completed choc-ruby.ps1'
