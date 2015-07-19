Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
CurDir = WshShell.CurrentDirectory

Const ForWriting = 2
Set objFSO = CreateObject("Scripting.FileSystemObject")
'if objFSO.FileExists(CurDir & "\uToday.dcu") then
'	objFSO.DeleteFile(CurDir & "\uToday.dcu")
'end if
Set objFile = objFSO.CreateTextFile(CurDir & "\uToday.pas")
objFile.Write "unit uToday;" & vbcrlf
objFile.Write "interface" & vbcrlf
objFile.Write "const" & vbcrlf
objFile.Write "COMPILETIME : String = '" & FormatDateTime(Now,2) & "';" & vbcrlf
'objFile.Write "COMPILETIME : String = '" & Now & "';" & vbcrlf
objFile.Write "implementation" & vbcrlf
objFile.Write "end." & vbcrlf
objFile.Close