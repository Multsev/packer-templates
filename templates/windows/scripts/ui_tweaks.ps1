# show file extensions
Write-Host "Show file extension"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value '0'

# show hidden files
Write-Host "Show hidden files"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -value '1'

# launch explorer to the PC not the user
Write-Host "Show launch explorer to the PC not the user"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -value '1'

Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'FullPathAddress' -value '1'

# disable notification popups
Write-Host "Disable notification popups"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'EnableBalloonTips' -value '0'

# disable error reporting popups
Write-Host "Disable error reporting popups"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\Windows Error Reporting' -Name 'DontShowUI' -value '0'

# disable prompting for a shutdown reason
Write-Host "Disable prompting for a shutdown reason"
Set-Itemproperty -path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name 'ShutdownReasonOn' -value '0'

# Set visual effects to best performance
Write-Host "Set visual effects to best performance"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name 'VisualFXSetting' -value '2'

# Don't use visual styles on windows and buttons
Write-Host "Don't use visual styles on windows and buttons"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ThemeManager' -Name 'ThemeActive' -value '1'

# Don't use common tasks in folders
Write-Host "Don't use common tasks in folders"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'WebView' -value '0'

# Don't show translucent selection rectangle
# Write-Host "Don't show translucent selection rectangle"
# Set-Itemproperty -path 'HKCU:' -Name '' -value '0'

# Don't use drop shadows for icon labels on the desktop
Write-Host "Don't use drop shadows for icon labels on the desktop"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ListviewShadow' -value '0'

# Don't use a background image for each folder type
Write-Host "Don't use a background image for each folder type"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ListviewWatermark' -value '0'

# Don't slide taskbar buttons
Write-Host "Don't slide taskbar buttons"
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarAnimations' -value '0'

# Don't animate windows when minimizing and maximizing
Write-Host "Don't animate windows when minimizing and maximizing"
Set-Itemproperty -path 'HKCU:\Control Panel\Desktop\WindowMetrics' -Name 'MinAnimate' -value '0'

# Don't show window contents while dragging
Write-Host "Don't show window contents while dragging"
Set-Itemproperty -path 'HKCU:\Control Panel\Desktop' -Name 'DragFullWindows' -value '0'

# Don't Smooth edges of screen fonts
Write-Host "Don't Smooth edges of screen fonts"
Set-Itemproperty -path 'HKCU:\Control Panel\Desktop' -Name 'FontSmoothing' -value '0'

# Don't smooth scroll list boxes

# Don't slide open combo boxes

# Don't fade or slide menus into view

# Don't show shadows under mouse pointer

# Don't fade or slide tooltips into view

# Don't fade out menu items after clicking

# Don't show shadows under menus
Write-Host "Don't show shadows under menus"
Set-Itemproperty -path 'HKCU:\Control Panel\Desktop' -Name 'UserPreferencesMask' -value '90,12,01,80'
