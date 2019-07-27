Procedure Rm()
  
  StatusBarImage( #statusbar, 0, ImageID (#imgremovesm) ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, removingfiles$ ,#PB_StatusBar_BorderLess)
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
  f$ = GetGadgetItemText( #files, a)
  h$ = Hashes( f$ )
  UnlockFile( datadir$ + f$ + dfs$ )
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
    
  DeleteFile ( datadir$ + f$ + dfs$ )
  
  RunProgram(ipfsexe$,ipfsrm$+h$,"",#PB_Program_Hide|#PB_Program_Wait)
  
EndIf
  
Next

  ClearGadgetItems(#files)
  GetFiles()
  
EndProcedure
Procedure Remove()
  
  c = CountGadgetItems(#files)
  
If c > 0
  
If busy=1
  
  MessageRequester("", pleasewait$)
  ProcedureReturn
  
EndIf
  
EndIf

  busy = 1

For a = 0 To c - 1
    
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
  
If MessageRequester("", removequestion$, #PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
  
  Rm()
  
  UpdateZIP()
  
EndIf

  Break
  
EndIf
  
Next

  StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)

  busy = 0

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP