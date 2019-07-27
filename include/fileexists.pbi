Procedure FileExists(filename.s)
  
  f=ReadFile(#PB_Any, filename,#PB_File_SharedRead)
  
If f
  
  CloseFile(f)
  r=1
  
EndIf

  ProcedureReturn r

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP