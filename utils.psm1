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
	$Host.UI.Write('Press any key to continue . . . ')
	$Host.UI.RawUI.ReadKey(6)|Out-Null
	$Host.UI.WriteLine()
}
