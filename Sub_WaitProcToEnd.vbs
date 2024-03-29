' SUB 
'  Keeps the wscript.exe running (waits) until the mentioned process ends. 
'  * usage: WaitProcToEnd "notepad.exe"
'  When a no instance of the mentioned process e.g "notepad.exe" is running iniproc=0, thus no loop.
'  When a single instance of the mentioned process e.g "notepad.exe" is running iniproc=1, thus enters loop.
'  When multiple instances of the mentioned process e.g "notepad.exe" is running, (e.g. 2 notepad windows) iniproc=2, 
'  thus doesnt enter loop, hence doesn't wait.
'  ***********************************************
Sub WaitProcToEnd(procname)
	Dim svc, sQuery, cproc, iniproc
	set svc=getobject("winmgmts:root\cimv2")
	sQuery="select * from win32_process where name=" & "'" & procname & "'"
	set cproc=svc.execquery(sQuery)
	iniproc=cproc.count    'it can be more than 1
	Do While iniproc = 1
    	wscript.sleep 5000
    	set svc=getobject("winmgmts:root\cimv2")
    	sQuery="select * from win32_process where name=" & "'" & procname & "'"
    	set cproc=svc.execquery(sQuery)
    	iniproc=cproc.count
	Loop
	set cproc=nothing
	set svc=nothing 
End Sub
