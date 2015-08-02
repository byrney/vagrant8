# toolsroot
Call 'toolsroot' { 
        Print "toolsroot"
        cinst -y toolsroot
    }

# sysinternals
Call 'sysinternals' { 
        Print "sysinternals"
        cinst -y sysinternals
    }

# webpicmd
Call 'webpicmd' { 
        Print "webpicmd"
        cinst -y webpicmd
    }

# vim
Call 'vim' { 
        Print "vim"
        cinst -y vim
        $gvimbin = "$programfiles\vim\vim74\gvim.exe"
        $gvimlink = "c:\Users\Public\Desktop\GVim"
        make-link "$gvimlink" "$gvimbin"
    }

# git
Call 'git' { 
        Print "git"
        cinst -y git
        [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")
    }

# cmder mini
Call 'cmder mini' { 
        Print "cmder mini"
        cinst -y cmdermini.portable
        make-link "c:\Users\Public\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"
    }
