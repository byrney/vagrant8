# Install Erlang
Call 'Install VS2012' { 
        write-host "Dot net dev tools"
        choco install -y visualstudiocommunity2013dex -source '\\VBOXSRV\vagrant'
        cinst -y NuGet.CommandLine 
        make-link "c:\Users\Public\Desktop\VS2013" "$programfiles\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
    }
