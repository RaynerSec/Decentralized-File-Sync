Procedure FileGetContents(filename.s)
 
  f=ReadFile(#PB_Any,filename,#PB_File_SharedRead)

If f
  
  s.q=Lof(f)
  
If s>0
  
  *m=AllocateMemory(s)
  ReadData(f,*m,s)
  
EndIf

  CloseFile(f)

EndIf

  ProcedureReturn *m

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP