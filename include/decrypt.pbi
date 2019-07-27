Procedure Decrypt( *mem, size, pw$ , fname$)
  
  t$ = temp$ + StringFingerprint(Str(Date()) , #PB_Cipher_MD5)
  
  CreateDirectory(t$)
  
  t$ = Addbackslash(t$)
  
  f$ = t$ + StringFingerprint(Str(Date()) , #PB_Cipher_MD5) + extsz$ 
  
  FilePutContents( f$ , *mem, size)
  
  FreeMemory( *mem )
   
  p = RunProgram(szexe$, "x " + GetFilePart(f$) + " -p" + pw$ , t$ , #PB_Program_Open | #PB_Program_Hide )
  
While ProgramRunning(p)
  
If WindowEvent() = #PB_Event_CloseWindow
  
  KillProgram(p)
  CloseProgram(p)
  DeleteDirectory( t$, "" )
  
  ProcedureReturn -1
  
EndIf

  Delay(5)
  
Wend

  temporaryfile$ = t$ + fname$

  ProcedureReturn 1
    
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP