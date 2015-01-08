
write-host "toolsroot"
cinst toolsroot

write-host "sysinternals"
cinst sysinternals

write-host "webpicmd"
cinst webpicmd

write-host "vim"
cinst vim
cmd /c mklink "c:\Users\All Users\Desktop\GVim" "c:\Program Files\vim\vim74\gvim.exe"

write-host "git"
cinst git

$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}
cmd /c mklink "c:\Users\All Users\Desktop\Git" "$programfiles\Git\Git Bash.vbs"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")

write-host "cmder mini"
cinst cmdermini.portable
cmd /c mklink "c:\Users\All Users\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"


