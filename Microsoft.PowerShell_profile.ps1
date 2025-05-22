oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json" | Invoke-Expression

#auto Autocompleteion
Import-Module PSReadLine

Set-PSReadLineOption -EditMode Emacs
# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
try { 
    Set-PSReadLineOption -PredictionSource History
}
catch {}

Set-PSReadLineKeyHandler -Chord "Ctrl+ " -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })

function Invoke-AmpRepositorySync {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        [String[]] $Args
    )
    python "C:\dev\fireamp-win\fireamp-win-connector-tools\WindowsDeveloperTools\AmpRepositorySync\AmpRepositorySync.py" $Args
}

Set-Alias ars Invoke-AmpRepositorySync

function baf {
    param($args)
    python C:\dev\fireamp-win\fireamp-win-connector-tools\WindowsDeveloperTools\AmpBuilder\AmpBuilder.py $args
}
Set-Alias -Name ba -Value baf

function gmockf {
    param($args)
    python "C:\dev\scripts\generator\GMockGenerator.py" -i $args
}
Set-Alias -Name gmock -Value gmockf

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
del alias:sl -Force

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
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

function admin-power { 
    Start-Process -Verb RunAs wt.exe
}
Set-Alias -Name admin -Value admin-power
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

function Sllogin {
    $AccountId = "355747651457"
    $RoleName = "engineer"
    # Run the 'sl aws session generate' command and capture the output
    $Output = sl aws session generate --account-id $AccountId --role-name $RoleName

    # Find the URL that matches the AWS sign-in pattern
    $Url = $Output -match 'https://us-east-1.signin.aws.amazon.com/' | Out-String

    if ($Url -eq $null -or $Url -eq "") {
        # If no URL is found, output the original command's output
        Write-Output $Output
    } else {
        # If a URL is found, open it in the default browser
        Start-Process $Url
    }
}

# Define an alias for the specific role and account
Set-Alias -Name onprem-test-eng -Value Sllogin
