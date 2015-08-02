Print 'Running choc-vs2015.ps1'

# Step 1: Install VisualStudio 2015 Community
Call 'Step 1: Install VisualStudio 2015 Community' { 
        choco install VisualStudio2015Community
    }
    
# Step vs2015AdminDeployment: Nuget CommandLine
Call 'Step 2: Nuget CommandLine' { 
        cinst -y NuGet.CommandLine
    }
    
# Step 3: Create VS2015 link
Call 'Step 3: Create VS2015 link' { 
        make-link "c:\Users\Public\Desktop\VS2015" "$programfiles\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
    }

Print 'Completed choc-vs2015.ps1'