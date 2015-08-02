# Install Erlang
Call 'Install Erlang' { 
        cinst erlang
        [Environment]::SetEnvironmentVariable("ERLANG_HOME", "${env:ProgramFiles}\erl6.2", "Machine")
    }
