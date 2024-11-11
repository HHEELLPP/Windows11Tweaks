# winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/plsWork.ps1')"
# pwsh.exe -w "Minimized" -c "Invoke-Expression (Invoke-WebRequest 'https://raw.githubusercontent.com/HHEELLPP/Windows11Tweaks/refs/heads/master/index.ps1')"
Invoke-Expression (Invoke-WebRequest (Invoke-WebRequest 'https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/utils.psm1'|ConvertFrom-Json).download_url)
if($PSVersionTable.PSEdition -ne 'Core') {
	if(-not (Test-CommandExists pwsh.exe)) {
		winget.exe install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
	}
	pwsh.exe -File $PSCommandPath
}
'Tada'
Stop-Program
