Procedure DoubleClick(run)
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
    
  DownloadFromIPFS ( GetGadgetItemText( #files, a), ipfsprefix$ + Hashes( GetGadgetItemText( #files, a) ) , GetGadgetItemData (#files, a), run)
  
  Break
  
EndIf
  
Next
    
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP