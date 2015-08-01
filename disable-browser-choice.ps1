."c:\vagrant\utils.ps1"

# Step 1: toolsroot
Call 'Step 1: BrowserChoice' { 
        if (Test-Path 'HKLM:\Software\BrowserChoice') {
            Set-ItemProperty -path 'HKLM:\Software\BrowserChoice' -name 'Enable' -type 'DWord' -value '0'
        }
    }
