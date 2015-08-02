
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
    $sw = [Diagnostics.Stopwatch]::StartNew()
    $text = 'Started task ' + $step + ': ' + $title
    Print $text
    &$block
    $sw.Stop()
    $text = 'Completed task ' + $step + ': ' + $title + ' - Elapsed: ' + $sw.Elapsed
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
