Procedure SiteSign(*site)
  
  busy = 1
  
  site$ = PeekS(*site, -1, #PB_UTF8)
    
  p = RunProgram(zeronetcmd$, sitesign$ + " " + site$ + " " + PrivateKey(site$), "" , hideopen)
  
While ProgramRunning(p)
  
  Delay(1000)
  a + 1
  
If a > timeout
      
  KillProgram(p)
  CloseProgram(p)
    
  busy = 0
  
  ProcedureReturn
  
EndIf
  
Wend
  
  CloseProgram(p)
  
  SitePublish(site$)
  
  busy = 0
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP