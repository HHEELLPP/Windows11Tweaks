function New-RegistryItem {
	[CmdletBinding()]
	param([Parameter(Mandatory=$true)][string]$LiteralPath)
	if((Test-Path -LiteralPath $LiteralPath) -ne $true) {
		New-Item $LiteralPath -Force -ea SilentlyContinue
	}
}
function Get-FirstPath {
	[CmdletBinding()]
	param([Parameter(Mandatory=$true)][string[]]$LiteralPath)
	for($i = 0; $i -lt $LiteralPath.Length; $i++) {
		if(Test-Path -LiteralPath $LiteralPath[$i]) {
			return $LiteralPath[$i]
		}
	}
}
function Stop-Program {
	$Host.UI.Write('Press any key to continue . . . ')
	$null = $Host.UI.RawUI.ReadKey(6)
	$Host.UI.WriteLine()
}
function Get-PowerShellEdition {
	if($PSVersionTable.PSEdition -eq 'Core') {
		'pwsh'
	} else {
		'PowerShell'
	}
}
function Test-CommandExists {
	param($command)
	$oldPreference = $ErrorActionPreference
	$ErrorActionPreference = ‘stop’
	try {
		if(Get-Command $command) {
			return $true
		}
	} catch {
		Write-Host “$command does not exist”
		return $false
	} finally {
		$ErrorActionPreference = $oldPreference
	}
}
