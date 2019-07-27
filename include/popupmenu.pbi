Macro PopupMenu()
  
  CreatePopupMenu(#popupmenu)
  
  MenuItem(#popupopen, open$)
  MenuItem(#popupdownload, download$)
  MenuItem(#popupcopy, copyhash$)
  MenuItem(#popupshare, share$)
  MenuItem(#popupremove, remove$)
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP