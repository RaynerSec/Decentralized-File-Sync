Macro TrayIconMenu()
  
  CreatePopupImageMenu(#trayiconmenu)
  MenuItem(#trayiconrestore, rstr$, ImageID(#imgtrayicon))
  MenuItem(#trayiconquit, quit$,ImageID(#imgquit))
    
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP