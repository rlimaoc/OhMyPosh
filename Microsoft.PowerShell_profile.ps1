if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
Import-Module -Name Terminal-Icons

oh-my-posh init pwsh --config 'C:\repositorios\git\pessoal\OhMyPosh\sysinfo.omp.json' | Invoke-Expression

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

#This is an example of a macro that you might use to execute a command.
#This will ad the command to history.
Set-PSReadLineKeyHandler -Key Ctrl+Shift+b `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Buyild the current directory" `
                         -ScriptBlock {
                            [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet build")
                            [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                         }

Set-PSReadLineKeyHandler -Key Ctrl+Shift+t `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Buyild the current directory" `
                         -ScriptBlock {
                            [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("dotnet test")
                            [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                         }
