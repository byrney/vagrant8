."c:\vagrant\utils.ps1"
    
$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

# Step 1: toolsroot
Call 'Step 1: toolsroot' { 
        write-host "toolsroot"
        cinst -y toolsroot
    }

# Step 1: sysinternals
Call 'Step 2: sysinternals' { 
        write-host "sysinternals"
        cinst -y sysinternals
    }

# Step 1: webpicmd
Call 'Step 3: webpicmd' { 
        write-host "webpicmd"
        cinst -y webpicmd
    }

# Step 1: vim
Call 'Step 4: vim' { 
        write-host "vim"
        cinst -y vim
        $gvimbin = "$programfiles\vim\vim74\gvim.exe"
        $gvimlink = "c:\Users\Public\Desktop\GVim"
        make-link "$gvimlink" "$gvimbin"
    }

# Step 1: git
Call 'Step 5: git' { 
        write-host "git"
        cinst -y git
        [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$programfiles\Git\bin", "Machine")
    }

# Step 1: cmder mini
Call 'Step 6: cmder mini' { 
        write-host "cmder mini"
        cinst -y cmdermini.portable
        make-link "c:\Users\Public\Desktop\Cmder" "c:\tools\cmdermini\Cmder.exe"
    }
