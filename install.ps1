Write-Host -ForegroundColor Blue install better ls (eza)
winget install eza-community.eza

Write-Host -ForegroundColor Blue install better cat (bat) 
winget install sharkdp.bat

Write-Host -ForegroundColor Blue install better grep (ripgrep)
winget install burntsushi.ripgrep

Write-Host -ForegroundColor Blue install better find (fd)
winget install sharkdp.fd

Write-Host -ForegroundColor Blue install neovim
winget install neovim.neovim

Write-Host -ForegroundColor Blue install better cd (zoxide)
winget install ajeetdsouza.zoxide

Write-Host -ForegroundColor Blue install better htop (bottom)
winget install clementtsang.bottom

Write-Host -ForegroundColor Blue install better fuzzy finder (fzf)
winget install fzf

Write-Host -ForegroundColor Blue install PSFzf (fzf for powershell)
Install-Module -Name PSFzf -Force
