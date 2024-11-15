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
	[CmdletBinding()]
	param()
	$Host.UI.Write('Press any key to continue . . . ')#'Press Enter to continue...: '
	<# https://learn.microsoft.com/dotnet/api/system.management.automation.host.readkeyoptions#fields #>
	$null = $Host.UI.RawUI.ReadKey(0b0110)#6 = 0b0110
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
	[CmdletBinding()]
	param(
		$command,
		[switch]$Invert
	)
	$oldPreference = $ErrorActionPreference
	$ErrorActionPreference = ‘stop’
	try {
		if(Get-Command $command) {
			return -not $Invert
		}
	} catch {
		Write-Host “$command does not exist”
		return $Invert
	} finally {
		$ErrorActionPreference = $oldPreference
	}
}
