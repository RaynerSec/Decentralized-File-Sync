Procedure IsZeroNetRunning(a=0)
  
  Protected snap.l , Proc32.PROCESSENTRY32 , dll_kernel32.l, FileName.s
  
  FileName = LCase(GetFilePart( zeronetexe$ ))
  
  dll_kernel32 = OpenLibrary (#PB_Any, kerneldll$)
  
If dll_kernel32
  
  snap = CallFunction (dll_kernel32, cth32snapshot$,$2, 0)
  
If snap
  
  Proc32\dwSize = SizeOf (PROCESSENTRY32)
  
If CallFunction (dll_kernel32, process32first$, snap, @Proc32) 
  
While CallFunction (dll_kernel32, process32next$, snap, @Proc32)
  
If LCase(PeekS (@Proc32\szExeFile,-1,#PB_UTF8)) = FileName
  
If a = 1
  
  r = 1
  
Else
  
If Trim ( LCase (ProcessNameFromID(Proc32\th32ProcessID) ) ) <> Trim (LCase( zeronetexe$ ))
    
  r=1
  
EndIf

EndIf

  CloseHandle_ (snap)
  CloseLibrary (dll_kernel32)
  
  ProcedureReturn r
  
EndIf

Wend

EndIf   

  CloseHandle_ (snap)
  
EndIf

  CloseLibrary (dll_kernel32)
  
EndIf

  ProcedureReturn 0

EndProcedure
Procedure IsZeroNet(a)
  
Repeat
  
  zerorunning = IsZeroNetRunning(a)
  Delay(1000)
  
ForEver
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP