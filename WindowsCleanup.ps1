#### Hides the PowerShell Window ####

$t = '[DllImport("user32.dll")] public static extern bool ShowWindow(int handle, int state);'
add-type -name win -member $t -namespace native
[native.win]::ShowWindow(([System.Diagnostics.Process]::GetCurrentProcess() | Get-Process).MainWindowHandle, 0)

#### Variables ####

	$objShell = New-Object -ComObject Shell.Application
	$objFolder = $objShell.Namespace(0xA)
	$temp = get-ChildItem "env:\TEMP"
	$temp2 = $temp.Value
	$swtools = "c:\SWTOOLS\*"
	$WinTemp = "c:\Windows\Temp\*"
	$shavlikDownloads = "C:\ProgramData\LANDESK\Shavlik Protect\Agent\Patch\PatchData\*"
	$proPatches = "C:\Windows\ProPatches\Patches\*"
	
#1# Remove temp files located in "C:\Users\USERNAME\AppData\Local\Temp"
	Remove-Item -Recurse  "$temp2\*" -Force

#2# Empties out the Temp Patching Directories
	Remove-Item -Recurse $shavlikDownloads -Force
	Remove-Item -Recurse $proPatches -Force
	
#3#	Empty Recycle Bin
	$objFolder.items() | %{ remove-item $_.path -Recurse -Confirm:$false}
	
#4# Remove Windows Temp Directory 
	Remove-Item -Recurse $WinTemp -Force 
	
#5# Running DISM Image Cleanup
	dism /online /Cleanup-Image /StartComponentCleanup

##### End of the Script #####