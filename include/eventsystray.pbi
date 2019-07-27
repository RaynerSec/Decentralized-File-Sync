Macro EventSystray()
      
If EventType() = #PB_EventType_LeftDoubleClick
  
  RemoveSysTrayIcon(#trayicon)
  HideWindow(#window,0)
  
ElseIf EventType() = #PB_EventType_RightClick
  
  DisplayPopupMenu(#trayiconmenu, WindowID(#window))
  
EndIf
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP