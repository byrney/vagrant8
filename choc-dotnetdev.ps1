write-host "Dot net dev tools"
# choco install -y visualstudiocommunity2013dex -source '\\VBOXSRV\vagrant'
choco install visualstudio2015community
cinst -y NuGet.CommandLine 
make-link "c:\Users\Public\Desktop\VS2015" "$programfiles\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"

