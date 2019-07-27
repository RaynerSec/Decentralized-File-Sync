Procedure UnLockFile(filename.s)
  
  f=LockedFiles(filename)
  
If IsFile(f)
  
  CloseFile(LockedFiles(filename))
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP