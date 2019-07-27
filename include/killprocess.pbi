Procedure KillProcess(full.s)
  
  Protected snap.l , Proc32.PROCESSENTRY32 , dll_kernel32.l
  
  fn.s = GetFilePart( full )
  dll_kernel32 = OpenLibrary (#PB_Any, kerneldll$)
 
If dll_kernel32
  
  snap = CallFunction (dll_kernel32, cth32snapshot$ ,$2, 0)
  
If snap
  
  Proc32\dwSize = SizeOf (PROCESSENTRY32)
  
If CallFunction (dll_kernel32, process32first$, snap, @Proc32) 
  
While CallFunction (dll_kernel32, process32next$, snap, @Proc32)
    
If Trim(LCase(PeekS (@Proc32\szExeFile,-1,#PB_UTF8))) = LCase(Trim(fn))
    
If Trim ( LCase (ProcessNameFromID(Proc32\th32ProcessID) ) ) = Trim (LCase( full ))
    
  TerminateProcess_(OpenProcess_(#PROCESS_ALL_ACCESS,0,Proc32\th32ProcessID),1)
      
EndIf

EndIf

Wend

EndIf   

  CloseHandle_ (snap)
  
EndIf

  CloseLibrary (dll_kernel32)
  
EndIf

  ProcedureReturn 0
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP