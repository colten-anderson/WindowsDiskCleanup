# WindowsDiskCleanup
Small Powershell script to free up disk space on C: drive

Steps that the script takes:

1. Removes temp files stored within the current user's local AppData
2. Deletes files within "C:\Windows\ProPatches\Patches\*" and the Ivanti patching folder
3. Empties the recycling bin
4. Deletes items from "C:\Windows\Temp\*"
5. Runs through Windows DISM clean up
