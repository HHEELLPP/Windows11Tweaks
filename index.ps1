function New-RegistryItem {
	param(
		[string]$LiteralPath
	)
	if((Test-Path -LiteralPath $LiteralPath) -ne $true) {
		New-Item $LiteralPath -Force -ea SilentlyContinue
	}
}
function Get-FirstPath {
	param(
		[string[]]$LiteralPath
	)
	$Rees = Test-Path -LiteralPath $LiteralPath
	for($i = 0; $i -lt $LiteralPath.Length; $i++) {
		if(Test-Path -LiteralPath $LiteralPath[$i]) {
			return $LiteralPath[$i]
		}
	}
}

taskkill /f /im explorer.exe 2>&1> $null

New-RegistryItem -LiteralPath 'HKCU:\Control Panel\Desktop'
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'TileWallpaper' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WallpaperOriginX' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WallpaperOriginY' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WallpaperStyle' -Value '10' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WindowArrangementActive' -Value '1' -PropertyType String -Force -ea SilentlyContinue;

New-Item -Path "U:\themes" -ItemType "directory" -Force
New-Item -Path "U:\themes\wallpapers" -ItemType "directory" -Force
Copy-Item -Path "$env:SystemRoot\web\wallpaper\Windows\*" -Destination "U:\themes\wallpapers" -Recurse
$WallPaperPath = Get-FirstPath -LiteralPath @(
	"U:\themes\wallpapers\img19.jpg"
	"U:\themes\wallpapers\img0.jpg"
)
if($WallPaperPath -ne $null) {
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WallPaper' -Value $WallPaperPath -PropertyType String -Force -ea SilentlyContinue;
}
New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'AutoColorization' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;

New-RegistryItem -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'AccentPalette' -Value ([byte[]](0xec,0xc6,0xf7,0x00,0xd2,0xa5,0xed,0x00,0xa6,0x6a,0xdc,0x00,0x95,0x54,0xd5,0x00,0x74,0x31,0xc9,0x00,0x4e,0x25,0x99,0x00,0x21,0x0f,0x6a,0x00,0x88,0x17,0x98,0x00)) -PropertyType Binary -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'StartColorMenu' -Value -3591820 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'AccentColorMenu' -Value -2796395 -PropertyType DWord -Force -ea SilentlyContinue;

New-RegistryItem -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DontPrettyPath' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideDrivesWithNoMedia' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'NavPaneExpandToCurrentFolder' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'NavPaneShowAllFolders' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'SeparateProcess' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ServerAdminUI' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSecondsInSystemClock' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSuperHidden' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAl' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;

New-RegistryItem -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes'
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesDesktopIcons' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesMousePointers' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'WallpaperSetFromTheme' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ColorSetFromTheme' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'CurrentTheme' -Value 'C:\Windows\resources\Themes\dark.theme' -PropertyType String -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeMRU' -Value 'C:\Windows\resources\Themes\dark.theme;C:\Windows\resources\Themes\aero.theme;' -PropertyType String -Force -ea SilentlyContinue;

New-RegistryItem -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ColorPrevalence' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'EnableTransparency' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ThemeChangesDesktopIcons' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ThemeChangesMousePointers' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'WallpaperSetFromTheme' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;

New-RegistryItem -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM'
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'Composition' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationColor' -Value -998293313 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationColorBalance' -Value 89 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationAfterglow' -Value -998293313 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationAfterglowBalance' -Value 10 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationBlurBalance' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'EnableWindowColorization' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorizationGlassAttribute' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'AccentColor' -Value -4243329 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'ColorPrevalence' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'EnableAeroPeek' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\DWM' -Name 'UseDpiScaling' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;

Start-Process explorer.exe

'Windows ' + [System.Environment]::OSVersion.Version.Major
