Procedure.s GetShortPath(long.s)
  
  short.s=Space(#MAX_PATH)
  
  GetShortPathName_(long,short,#MAX_PATH)
  
  ProcedureReturn short
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP