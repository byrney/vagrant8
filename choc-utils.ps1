."c:\vagrant\utils.ps1"
    
$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

# Step 1: toolsroot
Call 'Step 1: toolsroot' { 
        Print "toolsroot"
        cinst -y toolsroot
    }

# Step 1: sysinternals
Call 'Step 2: sysinternals' { 
        Print "sysinternals"
        cinst -y sysinternals
    }

# Step 1: webpicmd
Call 'Step 3: webpicmd' { 
        Print "webpicmd"
        cinst -y webpicmd
    }

# Step 1: vim
Call 'Step 4: vim' { 
        Print "vim"
        cinst -y vim
        $gvimbin = "$programfiles\vim\vim74\gvim.exe"
        $gvimlink = "c:\Users\Public\Desktop\GVim"
        make-link "$gvimlink" "$gvimbin"
    }

# Step 1: git
Call 'Step 5: git' { 
        Print "git"
        cinst -y git
        [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")
    }

# Step 1: cmder mini
Call 'Step 6: cmder mini' { 
        Print "cmder mini"
        cinst -y cmdermini.portable
        make-link "c:\Users\Public\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"
    }
