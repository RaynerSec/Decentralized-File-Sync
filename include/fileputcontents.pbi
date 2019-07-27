Procedure FilePutContents(filename.s, *mem, size)
  
  f=CreateFile(#PB_Any,filename)

If f
  
  res=WriteData(f,*mem,size)
  CloseFile(f)
  
If res=size
  r=1
Else
  r=0
EndIf
  
EndIf

  ProcedureReturn r

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP