Print 'Running utils'
    
# Step 1: toolsroot
Call 'Step 1: toolsroot' { 
        Print "toolsroot"
        cinst -y toolsroot
    }

# Step 2: sysinternals
Call 'Step 2: sysinternals' { 
        Print "sysinternals"
        cinst -y sysinternals
    }

# Step 3: webpicmd
Call 'Step 3: webpicmd' { 
        Print "webpicmd"
        cinst -y webpicmd
    }

# Step 4: vim
Call 'Step 4: vim' { 
        Print "vim"
        cinst -y vim
        $gvimbin = "$programfiles\vim\vim74\gvim.exe"
        $gvimlink = "c:\Users\Public\Desktop\GVim"
        make-link "$gvimlink" "$gvimbin"
    }

# Step 5: git
Call 'Step 5: git' { 
        Print "git"
        cinst -y git
        [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")
    }

# Step 6: cmder mini
Call 'Step 6: cmder mini' { 
        Print "cmder mini"
        cinst -y cmdermini.portable
        make-link "c:\Users\Public\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"
    }

Print 'Completed utils'