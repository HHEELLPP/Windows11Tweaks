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
	$Path = "Registry::"+$aa.Name
	foreach ($bb in $aa.Value.PSObject.Properties) {
		$Name = $bb.Name
		$Value = $bb.Value.Value
		$Type = $bb.Value.Type
		[PSCustomObject]@{
			Name = $Name
			Value = $Value
			Type = $Type
		}
		# Write-Output $Type
		if($Type -ieq "BINARY") {
			$Value = $Value -Split ","
		}
		Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type
	}
}

# $SPI_SETDESKWALLPAPER = 0x0014
# $SPIF_UPDATEINIFILE = 0x01
# $SPIF_SENDCHANGE = 0x02
# [User32]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, [IntPtr]::Zero, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
Start-Process explorer.exe

# $Creds = Get-Credential
# Restart-Computer -Credential $Creds -Force
