Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/utils.psm1')
if( -not (Test-CommandExists pwsh.exe)) {
	winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
}
Stop-Program
