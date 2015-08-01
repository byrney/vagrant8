function IsWinServer {
    $osname = (Get-WMIObject Win32_OperatingSystem).Caption | Out-String
    if($osname -match 'Server') {
        return $true;
    }
    return $false;
}

function UserExists([string] $username) {
    $objOu = [ADSI]"WinNT://${env:ComputerName}"
    $localUsers = $objOu.Children | where {$_.SchemaClassName -eq 'user'}  |  % {$_.name[0].ToString().ToLower()}
    Write-Host $localUsers
    if($localUsers -contains $username.ToLower()) {
        return $true;
    }
    return $false;
}

function Call([string]$title, $block) {
    Write-Host '==== START ' $title
    Try {
        &$block
    }
    Catch [Excpetion] {
        Write-Host '==== ERROR ' $_.Exception.Message
        pause
    }
    Write-Host '==== END ' $title
}
