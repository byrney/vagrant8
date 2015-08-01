function Print([string]$text) {
    Write-Host $text
    $text | Out-File c:\vagrant-logs\vagrant.log -Append
}

function Call([string]$title, $block) {
    $text = '---[START]--> ' + $title
    Print $text
    Try {
        &$block
    }
    Catch [Exception] {
        $text = '---[ERROR]--> ' + $_.Exception.Message
        Print $text
    }
    $text = '---[END]--> ' + $title
    Print $text
}

function make-link {
    $link = $args[0];
    $dest = $args[1];
    if(test-path "$link") {
        rm "$link"
    }
    cmd /c mklink  "$link" "$dest"
}
