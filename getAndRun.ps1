# winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/plsWork.ps1')"
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/index.ps1')"
Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/utils.psm1')
if($PSVersionTable.PSEdition -ne 'Core') {
	if(-not (Test-CommandExists pwsh.exe)) {
		winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
	}
	pwsh.exe -c $MyInvocation.MyCommand.ScriptBlock
}
'Tada'
Stop-Program
