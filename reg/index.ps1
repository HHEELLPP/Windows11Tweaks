Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class User32 {
	[DllImport("user32.dll", SetLastError = true)]
	public static extern bool SystemParametersInfo(uint action, uint param, IntPtr vparam, uint init);
}
"@
Invoke-WebRequest  `
-Uri (ConvertFrom-Json (Invoke-WebRequest -Uri "https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/index.reg").Content).download_url `
-OutFile ".\index.reg"

taskkill /f /im explorer.exe 2>&1> $null
reg import ".\index.reg"
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02
[User32]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, [IntPtr]::Zero, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
Start-Process explorer.exe

Remove-Item -LiteralPath ".\index.reg"
