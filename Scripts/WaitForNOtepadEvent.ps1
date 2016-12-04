﻿function WaitForNotePadEvent{
$alarm = New-Object Management.EventQuery
$alarm.QueryString = "Select * from __InstanceCreationEvent `
WITHIN 1 WHERE targetinstance isa 'Win32_Process' AND `
targetinstance.name = 'notepad.exe'"
$watch = New-Object Management.ManagementEventWatcher $alarm
#Start Notepad after issuing a wait command:
$result = $watch.WaitForNextEvent()
#Get target instance of Notepad:
#$result.targetinstance
#Access the live instance:
$path = $result.targetinstance.__path
$live = [wmi]$path
# Close Notepad using the live instance
Write-Host "A process $live.Name has started"
}