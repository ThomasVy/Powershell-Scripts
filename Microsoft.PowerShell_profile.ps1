Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
Invoke-Expression (& { (zoxide init powershell | Out-String) })

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

Set-Alias -Name cat -Value bat
Set-Alias -Name ls -Value eza
function eza-ll {
    eza -alh
}
Set-Alias -Name ll -Value eza-ll
function eza-tree {
    eza --tree
}
Set-Alias -Name tree -Value eza-tre
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json" | Invoke-Expression
