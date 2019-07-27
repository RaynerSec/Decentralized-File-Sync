Procedure RightClick()
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
    
  s + 1
  
EndIf
  
Next

If s = 1
  
  DisableMenuItem(#popupmenu, #popupopen, 0)
  DisableMenuItem(#popupmenu, #popupdownload, 0)
  DisableMenuItem(#popupmenu, #popupshare, 0)
  DisableMenuItem(#popupmenu, #popupcopy, 0)
  
  DisplayPopupMenu(#popupmenu, WindowID(#window))
  
ElseIf s > 1
  
  DisableMenuItem(#popupmenu, #popupopen, 1)
  DisableMenuItem(#popupmenu, #popupdownload, 1)
  DisableMenuItem(#popupmenu, #popupshare, 1)
  DisableMenuItem(#popupmenu, #popupcopy, 1)
  
  DisplayPopupMenu(#popupmenu, WindowID(#window))
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP