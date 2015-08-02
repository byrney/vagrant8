
$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

function Print([string]$text) {
    Write-Host $text
    CreateDir c:\vagrant-logs
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

function CreateDir([string]$targetdir) {
    if(!(Test-Path -Path $targetdir )){
        New-Item -ItemType directory -Path $targetdir
        Print 'Creted directory ' + $targetdir
    }
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
