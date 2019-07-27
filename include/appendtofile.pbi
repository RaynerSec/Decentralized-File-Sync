Procedure AppendToFile(fn$,s$)
  
  f = OpenFile(#PB_Any, fn$)
  
If f
  
  length=Lof(f)
  FileSeek(f, length)
  WriteString(f,RSet(s$,1000),#PB_UTF8)
  CloseFile(f)
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP