Procedure KillThreads()
    
ForEach Threads()
  
If IsThread(Threads())
  
  KillThread(Threads())
    
EndIf
  
Next

  ClearList(Threads())

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP