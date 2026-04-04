$MyHome = if ($env:MY_HOME) { $env:MY_HOME } else { $HOME }
. (Join-Path $MyHome 'git\bin\profile.ps1')
