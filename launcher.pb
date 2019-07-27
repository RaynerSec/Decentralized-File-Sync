If ReadFile(0, ProgramFilename())
  
  length = Lof(0)
  
  FileSeek(0, length - 1000) 
  
  *m=AllocateMemory(1000)
  
  ReadData(0,*m,1000)
  
  CloseFile(0)
  
  p$ = Trim(PeekS(*m,1000,#PB_UTF8))
  
If ReadFile(0, p$)
  
  CloseFile(0)
  
  RunProgram(p$, "/hide", GetPathPart(p$))
  
EndIf
  
EndIf 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; EnableXP
; Executable = launcher.exe