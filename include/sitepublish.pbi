Procedure SitePublish(site$)
  
  busy = 1
  
  p = RunProgram(zeronetcmd$, sitepublish$ + " " + site$, "" , hideopen)
  
While ProgramRunning(p)
  
  Delay(1000)
  
  a + 1
  
If a > timeout And ProgramRunning(p)
  
  KillProgram(p)
  CloseProgram(p)
    
  busy = 0
  
  ProcedureReturn
  
EndIf
  
Wend
  
  CloseProgram(p)
  
  busy = 0
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP