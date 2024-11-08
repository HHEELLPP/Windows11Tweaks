Invoke-Expression (Invoke-WebRequest (Invoke-WebRequest 'https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/utils.psm1' | ConvertFrom-Json).download_url).Content

taskkill /f /im explorer.exe 2>&1> $null
try {
	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'TileWallpaper' -Value '0' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'WallpaperOriginX' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'WallpaperOriginY' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'WallpaperStyle' -Value '10' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'WindowArrangementActive' -Value '1' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'

	New-Item -Path 'U:\themes' -ItemType 'directory' -Force
	New-Item -Path 'U:\themes\wallpapers' -ItemType 'directory' -Force
	if((Test-Path -LiteralPath "$env:SystemRoot\web\wallpaper\Windows\img19.jpg" -PathType 'Leaf')-and(-not (Test-Path -LiteralPath 'U:\themes\wallpapers\img19.jpg' -PathType 'Leaf'))){Copy-Item -Path "$env:SystemRoot\web\wallpaper\Windows\img19.jpg" -Destination 'U:\themes\wallpapers\img19.jpg'}
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'WallPaper' -Value 'U:\themes\wallpapers\img19.jpg' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop' -Name 'AutoColorization' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'

	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'AccentPalette' -Value ([byte[]](0xec,0xc6,0xf7,0x00,0xd2,0xa5,0xed,0x00,0xa6,0x6a,0xdc,0x00,0x95,0x54,0xd5,0x00,0x74,0x31,0xc9,0x00,0x4e,0x25,0x99,0x00,0x21,0x0f,0x6a,0x00,0x88,0x17,0x98,0x00)) -PropertyType 'Binary' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'StartColorMenu' -Value -3591820 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name 'AccentColorMenu' -Value -2796395 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'

	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'DontPrettyPath' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideDrivesWithNoMedia' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'NavPaneExpandToCurrentFolder' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'NavPaneShowAllFolders' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'SeparateProcess' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ServerAdminUI' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSecondsInSystemClock' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSuperHidden' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowSyncProviderNotifications' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAl' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'

	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesDesktopIcons' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeChangesMousePointers' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'WallpaperSetFromTheme' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ColorSetFromTheme' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'CurrentTheme' -Value 'C:\Windows\resources\Themes\dark.theme' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes' -Name 'ThemeMRU' -Value 'C:\Windows\resources\Themes\dark.theme;C:\Windows\resources\Themes\aero.theme;' -PropertyType 'String' -Force -ErrorAction 'SilentlyContinue'

	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ColorPrevalence' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'EnableTransparency' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ThemeChangesDesktopIcons' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'ThemeChangesMousePointers' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'WallpaperSetFromTheme' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'

	New-RegistryItem -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'Composition' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationColor' -Value -998293313 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationColorBalance' -Value 89 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationAfterglow' -Value -998293313 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationAfterglowBalance' -Value 10 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationBlurBalance' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'EnableWindowColorization' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorizationGlassAttribute' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'AccentColor' -Value -4243329 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'ColorPrevalence' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'EnableAeroPeek' -Value 1 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'
	New-ItemProperty -LiteralPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM' -Name 'UseDpiScaling' -Value 0 -PropertyType 'DWord' -Force -ErrorAction 'SilentlyContinue'

	$UserId = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
	New-RegistryItem -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International"
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iMeasure' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 's1159' -Value 'AM' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sNegativeSign' -Value '-' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iNegCurr' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sGrouping' -Value '3;0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'LocaleName' -Value 'en-US' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'NumShape' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sMonDecimalSep' -Value '.' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iCalendarType' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sDate' -Value '-' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sTimeFormat' -Value 'h:mm:ss tt' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sList' -Value ',' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 's2359' -Value 'PM' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iFirstDayOfWeek' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iDate' -Value '2' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sLanguage' -Value 'ENU' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sShortDate' -Value 'yyyy-MM-dd' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sLongDate' -Value 'dddd, MMMM d, yyyy' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sTime' -Value ':' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iPaperSize' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iDigits' -Value '2' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iCountry' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sCurrency' -Value '$' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sMonGrouping' -Value '3;0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iTLZero' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sYearMonth' -Value 'MMMM yyyy' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iTimePrefix' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sMonThousandSep' -Value ',' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iCurrDigits' -Value '2' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sShortTime' -Value 'h:mm tt' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sDecimal' -Value '.' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sThousand' -Value ',' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iCurrency' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'Locale' -Value '00000409' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iNegNumber' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iLZero' -Value '1' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iFirstWeekOfYear' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sPositiveSign' -Value '' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'sNativeDigits' -Value '0123456789' -PropertyType 'String' -Force -ea SilentlyContinue
	New-ItemProperty -LiteralPath "Registry::HKEY_USERS\$UserId\Control Panel\International" -Name 'iTime' -Value '0' -PropertyType 'String' -Force -ea SilentlyContinue
} finally {Start-Process explorer.exe}

<#
Write-Host 'Windows ', [System.Environment]::OSVersion.Version.Major
Write-Host 'AKA.'
#>
$Sumn = Get-WmiObject Win32_OperatingSystem
Write-Host $Sumn.Caption, $Sumn.OSArchitecture
