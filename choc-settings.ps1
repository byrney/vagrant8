."c:\vagrant\utils.ps1"
    
Print 'Running choc-settings.ps1'

# Step 1: Chocolatey settings
Call 'Step 1: Chocolatey settings' { 
        chocolatey feature enable -n allowGlobalConfirmation
    }

Print 'Completed choc-settings.ps1'