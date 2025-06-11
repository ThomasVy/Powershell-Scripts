Write-Host -ForegroundColor Blue "install better ls (eza)"
winget install eza-community.eza

Write-Host -ForegroundColor Blue "install better cat (bat)"
winget install sharkdp.bat

Write-Host -ForegroundColor Blue "install better grep (ripgrep)"
winget install BurntSushi.ripgrep.MSVC

Write-Host -ForegroundColor Blue "install power toys"
winget install --id Microsoft.PowerToys --source winget

Write-Host -ForegroundColor Blue "install better find (fd)"
winget install sharkdp.fd

Write-Host -ForegroundColor Blue "install neovim"
winget install neovim.neovim

Write-Host -ForegroundColor Blue "install better cd (zoxide)"
winget install ajeetdsouza.zoxide

Write-Host -ForegroundColor Blue "install better htop (bottom)"
winget install bottom

Write-Host -ForegroundColor Blue "install better fuzzy finder (fzf)"
winget install fzf

Write-Host -ForegroundColor Blue "install Windows Terminal"
winget install --id Microsoft.WindowsTerminal -e

Write-Host -ForegroundColor Blue "install Windows less"
winget install jftuga.less

Write-Host -ForegroundColor Blue "install Powershell 7"
winget install --id Microsoft.PowerShell --source winget

Write-Host -ForegroundColor Blue "Setting Window Terminal Settings"
Copy WindowsTerminalSettings.json "$env:USERPROFILE\\AppData\\Local\\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

Write-Host -ForegroundColor Blue "install OhMyPosh"
winget install JanDeDobbeleer.OhMyPosh -s winget

oh-my-posh font install meslo
Write-Host -ForegroundColor Blue "Please set the terminal font to MesloLGS NF https://ohmyposh.dev/docs/installation/fonts#configuration"

