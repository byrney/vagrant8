."c:\vagrant\utils.ps1"
	
Print 'Running choc-ruby.ps1'
	
# Step 1: Install Ruby
Call 'Step 1: Install Ruby' { 
		start-process -wait -verb runas -argumentlist "ruby -version 2.1.6" cinst
		start-process -wait -verb runas -argumentlist "rubygems -version 2.4.1.0" cinst
		start-process -wait -verb runas cinst ruby2.devkit
		
		#  NB. Must call gem in another shell env vars not set in this one
		#gem source -a http://rubygems.org
		#gem install bundler
    }

Print 'Completed choc-ruby.ps1'
