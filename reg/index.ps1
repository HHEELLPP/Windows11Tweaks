Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32 {
	[DllImport("user32.dll", SetLastError = true)]
	public static extern bool SystemParametersInfo(uint action, uint param, IntPtr vparam, uint init);
}
"@
$aadadf = ConvertFrom-Json (Invoke-WebRequest  -Uri (ConvertFrom-Json (Invoke-WebRequest -Uri "https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/index.json").Content).download_url)

taskkill /f /im explorer.exe 2>&1> $null

foreach ($aa in $aadadf.PSObject.Properties) {
	$Path = "Registry::$($aa.Name)"
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
[User32]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, [IntPtr]::Zero, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
Start-Process explorer.exe

$Creds = Get-Credential
Restart-Computer -Credential $Creds -Force
# HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Accent: [
# 		"AccentPalette": {
# 			"Type": "BINARY",
# 			"Value": "ec,c6,f7,00,d2,a5,ed,00,a6,6a,dc,00,95,54,d5,00,74,31,c9,00,4e,25,99,00,21,0f,6a,00,88,17,98,00"
# 		},
#   ]
