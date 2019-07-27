Procedure.s AddBackslash(path.s)
    
If Right(path,1) <> backslash$
  
  path=path+backslash$
  
EndIf

  ProcedureReturn path

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP