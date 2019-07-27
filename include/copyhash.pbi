Procedure CopyHash( pfix$, msgtext$ )
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
    
  SetClipboardText( Hashes( GetGadgetItemText( #files, a) ) )
  MessageRequester("", msgtext$)
  
  Break
  
EndIf
  
Next
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP