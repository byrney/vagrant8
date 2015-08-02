
$step = 1

$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

function Print([string]$output) {
    $text = '[' + $(get-date -f HH:mm:ss) + '] ' + $output
    Write-Host $text
}

function Call([string]$title, $block) {
    $text = 'Started step ' + $step + ': ' + $title
    Print $text
    &$block
    $text = 'Completed step ' + $step + ': ' + $title
    Print $text
    $step = $step + 1
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
