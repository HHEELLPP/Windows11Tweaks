# winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/plsWork.ps1')"
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/index.ps1')"
if($PSVersionTable.PSEdition -neq 'Core') {
	try {
		pwsh.exe -File $PSCommandPath
	} catch {
		winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
	}
}
