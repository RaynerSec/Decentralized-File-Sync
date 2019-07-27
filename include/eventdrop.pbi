Procedure EventDrop(*files)
  
  ClearList( AlreadyAdded() )
  ClearList( Files() )
  
  Files$ = PeekS(*files,-1)
  
  Count  = CountString(Files$, Chr(10)) + 1
    
For i = 1 To Count
  
  f$ = StringField(Files$, i, Chr(10))
      
If FileExists( datadir$ + GetFilePart( f$ ) + dfs$ )
  
If FileExists( f$ )
  
  AddElement( AlreadyAdded() )
  
  AlreadyAdded() = f$
  
  filecount-1
  
EndIf
  
ElseIf FileExists( f$ )
  
  AddElement( Files() )
  
  Files() = f$
 
EndIf
  
Next i

  AddToIPFS()
    
  done = 2
  
  busy = 0
  
  ProcedureReturn
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP