Option Explicit

Dim shell, fso, projectDir, checkCode, serverCmd
Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' เปลี่ยนเป็นที่อยู่ของโปรเจคต์
projectDir = fso.GetParentFolderName(WScript.ScriptFullName)
If Not fso.FileExists(projectDir & "\index.html") Then
  projectDir = "C:\Users\Computer01\Thitipong\RPG15-School\RPG15"
End If

checkCode = shell.Run("cmd /c where http-server >nul 2>&1", 0, True)
If checkCode <> 0 Then
  MsgBox "Could not find http-server command." & vbCrLf & _
         "Install it once with: npm install -g http-server", _
         vbCritical, "RPG15 Startup"
  WScript.Quit 1
End If

serverCmd = "cmd /c cd /d """ & projectDir & """ && http-server --proxy http://localhost -p 8080"
shell.Run serverCmd, 0, False

WScript.Sleep 5000
shell.Run "http://localhost:8080/?sn=202604150001", 0, False
' เปลี่ยนทsnที่ต้องการ ติดตั้ง npm install -g http-server ด้วยถ้ายังไม่ได้ติดตั้ง http-server
