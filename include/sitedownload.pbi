Procedure SiteDownload(*site)

  site$ = PeekS(*site, -1 )
      
  p = RunProgram(zeronetcmd$, sitedownload$ + " " + site$, "" , hideopen)
  
While ProgramRunning(p)
  
  Delay(1000)
  a + 1
  
If a > timeout
      
  KillProgram(p)
  CloseProgram(p)

  busy = 0
  
  ProcedureReturn -1
  
EndIf
  
Wend

  CloseProgram(p)
  
  ProcedureReturn 1
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP