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

# function Switch-Theme {
# 	[CmdletBinding()]
# 	param (
# 		[Parameter(
# 			ValueFromPipeline
# 		)]
# 		[ValidateSet("toggle","dark","light")]
# 		[string]$theme
# 	)
# 	$pathProps = (Get-ItemProperty -LiteralPath $path)
# 	$val = switch ($theme) {
# 		"dark" {(0,0)}
# 		"light" {(1,1)}
# 		"toggle" {(($pathProps.SystemUsesLightTheme -bxor 1), ($pathProps.AppsUseLightTheme -bxor 1))}
# 		default {(($pathProps.SystemUsesLightTheme -bxor 1), ($pathProps.AppsUseLightTheme -bxor 1))}
# 	}
# 	Write-Output ("SystemUsesLightTheme: " + $pathProps.SystemUsesLightTheme)
# 	Write-Output ("New SystemUsesLightTheme: " + $val[0])
# 	# Set-ItemProperty -Path $path -Name "SystemUsesLightTheme" -Value $val[0]
# 	Write-Output ("AppsUseLightTheme: " + $pathProps.AppsUseLightTheme)
# 	Write-Output ("New AppsUseLightTheme: " + $val[1])
# 	# Set-ItemProperty -Path $path -Name "AppsUseLightTheme" -Value $val[1]
# 	Write-Output ""

# 	Write-Output "$env:APPDATA"
# }
# Switch-Theme


# function Set-WallPaper {

# 	<#
# 		.SYNOPSIS
# 		Applies a specified wallpaper to the current user's desktop

# 		.PARAMETER Image
# 		Provide the exact path to the image

# 		.PARAMETER Style
# 		Provide wallpaper style (Example: Fill, Fit, Stretch, Tile, Center, or Span)

# 		.EXAMPLE
# 		Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
# 		Set-WallPaper -Image "C:\Wallpaper\Background.jpg" -Style Fit
# 	#>

# 	param (
# 		[parameter(Mandatory = $True)]
# 		# Provide path to image
# 		[string]$Image,
# 		# Provide wallpaper style that you would like applied
# 		[parameter(Mandatory = $False)]
# 		[ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
# 		[string]$Style
# 	)

# 	$WallpaperStyle = switch ($Style) {
# 		"Fill" {"10"}
# 		"Fit" {"6"}
# 		"Stretch" {"2"}
# 		"Tile" {"0"}
# 		"Center" {"0"}
# 		"Span" {"22"}
# 	}

# 	if($Style -eq "Tile") {
# 		New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
# 		New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force
# 	} else {
# 		New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
# 		New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
# 	}

#

# 	$SPI_SETDESKWALLPAPER = 0x0014
# 	$UpdateIniFile = 0x01
# 	$SendChangeEvent = 0x02

# 	$fWinIni = $UpdateIniFile -bor $SendChangeEvent

# 	$ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
# }
# Set-WallPaper -Image "C:\Wallpaper\Background.jpg" -Style Fit
