# Install VisualStudio 2015 Community
Call 'Install VisualStudio 2015 Community' { 
        choco install VisualStudio2015Community
    }
    
# Step vs2015AdminDeployment: Nuget CommandLine
Call 'Nuget CommandLine' { 
        cinst -y NuGet.CommandLine
    }
    
# Create VS2015 link
Call 'Create VS2015 link' { 
        make-link "c:\Users\Public\Desktop\VS2015" "$programfiles\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
    }
