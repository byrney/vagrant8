Print 'Running chocolatey configuration'

# Step 1: Install Erlang
Call 'Step 1: Install allowGlobalConfirmation' { 
		chocolatey feature enable -n allowGlobalConfirmation
    }

Print 'Completed chocolatey configuration'