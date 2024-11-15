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
	$Host.UI.RawUI.ReadKey(0b0110)|Out-Null
	$Host.UI.WriteLine()
}
