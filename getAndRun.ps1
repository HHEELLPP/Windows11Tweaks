winget install --id Microsoft.PowerShell --source winget --scope user --exact --accept-source-agreements --accept-package-agreements
PowerShell.exe -WindowStyle "Minimized" "Invoke-Expression (Invoke-WebRequest (Invoke-WebRequest 'https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/plsWork.ps1' | ConvertFrom-Json).download_url)"
PowerShell.exe -WindowStyle "Minimized" "Invoke-Expression (Invoke-WebRequest (Invoke-WebRequest 'https://api.github.com/repos/HHEELLPP/Windows11Tweaks/contents/index.ps1' | ConvertFrom-Json).download_url)"
