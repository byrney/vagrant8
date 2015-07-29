$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

function make-link
{
    $link = $args[0];
    $dest = $args[1];
    if(test-path "$link") {
        rm "$link"
    }
    cmd /c mklink  "$link" "$dest"
}

write-host "Dot net dev tools"
choco install -y visualstudiocommunity2013dex -source '\\VBOXSRV\vagrant'
cinst -y NuGet.CommandLine 
make-link "c:\Users\Public\Desktop\VS2013" "$programfiles\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe"

