Procedure Resize()
  
  w = WindowWidth(#window)
  h = WindowHeight(#window)
  t = ToolBarHeight(#toolbar)
  mh = MenuHeight()
  sbh = StatusBarHeight(#statusbar)
  
  ResizeGadget(#files, #PB_Ignore, #PB_Ignore, w - 4 , h - t - mh - sbh - 2 )
 
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP