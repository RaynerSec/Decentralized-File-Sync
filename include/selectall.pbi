Macro SelectAll()
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
  SetGadgetItemState(#files,a,#PB_ListIcon_Selected)
  
Next
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP