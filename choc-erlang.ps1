."c:\vagrant\utils.ps1"

# Step 1: Install Erlang
Call 'Step 1: Install Erlang' { 
        cinst erlang
        [Environment]::SetEnvironmentVariable("ERLANG_HOME", "${env:ProgramFiles}\erl6.2", "Machine")
    }
