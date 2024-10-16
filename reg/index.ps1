Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32 {
	[DllImport("user32.dll", SetLastError = true)]
	public static extern bool SystemParametersInfo(uint action, uint param, IntPtr vparam, uint init);
}
"@
Invoke-WebRequest  `
-Uri (ConvertFrom-Json (Invoke-WebRequest -Uri "https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/index.json").Content).download_url `
-OutFile ".\index.json"

taskkill /f /im explorer.exe 2>&1> $null

$aadadf = Get-Content ".\index.json" | ConvertFrom-Json -Depth 5
foreach ($aa in $aadadf.PSObject.Properties) {
	$Path = $aa.Name
	foreach ($bb in $aa.Value.PSObject.Properties) {
		$Name = $bb.Name
		$Value = $bb.Value.Value
		$Type = $bb.Value.Type
		Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type
	}
}

$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02
[User32]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, "$env:SystemRoot\web\wallpaper\Windows\img19.jpg", $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
Start-Process explorer.exe

Remove-Item -LiteralPath ".\index.json"

$Creds = Get-Credential
Restart-Computer -Credential $Creds -Force
