
$programfiles=${env:ProgramFiles(x86)}
if($programfiles -eq "") {
    $programfiles=${env:ProgramFiles}
}

write-host "Erlang"
cinst erlang
[Environment]::SetEnvironmentVariable("ERLANG_HOME", "c:\$programfiles\erl6.2", "Machine")
