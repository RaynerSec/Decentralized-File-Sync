Macro Menu()
      
  CreateImageMenu(#menu, WindowID(#window), #PB_Menu_ModernLook)
  
  MenuTitle(file$)
  MenuItem(#menuadd, add$, ImageID(#imgaddsm))
  MenuItem(#menuremove, remove$, ImageID(#imgremovesm))
  MenuItem(#menusync, sync$, ImageID(#imgtrayicon))
  MenuBar()
  MenuItem(#menusettings, settings$, ImageID(#imgsettingssm))
  MenuBar()
  MenuItem(#menuquit, quit$, ImageID(#imgquit))
  
  MenuTitle("?")
  
  MenuItem(#menuupdate, update$, ImageID(#imgupdatesm))
  MenuItem(#menuwebsite, website$, ImageID(#imgwebsitesm))
  MenuItem(#menuabout, about$, ImageID(#imgaboutsm))
  MenuBar()
  MenuItem(#menudonate, donate$, ImageID(#imgdonatesm))
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP