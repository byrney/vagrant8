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

write-host "toolsroot"
cinst -y toolsroot

write-host "sysinternals"
cinst -y sysinternals

write-host "webpicmd"
cinst -y webpicmd

write-host "vim"
cinst -y vim
$gvimbin = "$programfiles\vim\vim74\gvim.exe"
$gvimlink = "c:\Users\All Users\Desktop\GVim"
make-link "$gvimlink" "$gvimbin"

write-host "git"
cinst -y git

[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")

write-host "cmder mini"
cinst -y cmdermini.portable
make-link "c:\Users\All Users\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"


