Macro StatusBar()
  
  CreateStatusBar( #statusbar, WindowID(#window) )
  AddStatusBarField(24)
  AddStatusBarField(400)
  
  StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
    
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP