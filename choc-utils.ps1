
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
cmd /c mklink "c:\Users\All Users\Desktop\Git" "c:\Program Files\Git\Git Bash.vbs"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Git\bin", "Machine")

write-host "cmder mini"
cinst cmdermini.portable
cmd /c mklink "c:\Users\All Users\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"


