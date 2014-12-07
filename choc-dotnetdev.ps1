
write-host "Dot net dev tools"
# cinst DotNet3.5 VS2010.ShellIntegratedRedist windows-8-1-sdk DotNet4.5 VisualStudio2013Professional NuGet.CommandLine 
# cinst DotNet3.5 VisualStudio2013Professional NuGet.CommandLine 
cinst VisualStudio2013Professional NuGet.CommandLine 
#[Environment]::SetEnvironmentVariable("VisualStudioVersion", "11.0", "Machine")
cmd /c mklink "c:\Users\All Users\Desktop\VS2013" "c:\program files\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"
write-host "IISExpress via webpi"
start-process -wait -verb runas choco -argumentlist 'webpi IISExpress'

