oh-my-posh init pwsh --config "$PSScriptRoot\amro.omp.json" | Invoke-Expression

#auto Autocompleteion
Import-Module PSReadLine

Set-PSReadLineOption -EditMode Emacs
# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "Alt+l" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView

$commandOverride = [ScriptBlock] { param($Location) Set-Location $Location } 
# example command - use $Location with a different command:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' -PSReadlineChordSetLocation 'Alt+c'

Set-PsFzfOption -AltCCommand $commandOverride

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

function rdpf {
    az network bastion rdp --name "general-clean-bastion1" --resource-group "clean-infra" --target-resource-id "/subscriptions/cd684e53-2b0b-46de-a043-e7d942de9433/resourceGroups/amp-windows-dev/providers/Microsoft.Compute/virtualMachines/Thomas"
}
Set-Alias -Name rdp -Value rdpf

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

del alias:cat -Force
del alias:ls -Force
del alias:rm -Force

Set-Alias -Name cat -Value bat
Set-Alias -Name ls -Value eza
function eza-ll {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [String[]] $Args
    )
    eza -alh --icons $Args
}
Set-Alias -Name ll -Value eza-ll
Set-Alias -Name l -Value eza-ll
function eza-tree {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [String[]] $Args
    )
    eza --tree $Args
}
Set-Alias -Name tree -Value eza-tree

function admin-run {
    Start-Process -Verb RunAs wt.exe 
}
Set-Alias -Name admin -Value admin-run
function copy-current-directory {
    (pwd).Path | Set-Clipboard
    Write-Host "Copied current directory to clipboard"
}
Set-Alias -Name cop -Value copy-current-directory

Set-Alias -Name vim -Value nvim

function Remove-Item-Recursively {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [String[]] $Args
    )
    Remove-Item -Recurse -Force $Args
}
Set-Alias -Name rm -Value Remove-Item-Recursively
