Macro Toolbar()
      
  CreateToolBar(#toolbar,WindowID(#window),#PB_ToolBar_Large | #PB_ToolBar_Text )
  
  ToolBarImageButton(#toolbaradd, ImageID(#imgaddlg), #PB_ToolBar_Normal, add$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarremove, ImageID(#imgremovelg), #PB_ToolBar_Normal, remove$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarsync, ImageID(#imgsync), #PB_ToolBar_Normal, sync$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarsettings, ImageID(#imgsettingslg), #PB_ToolBar_Normal, settings$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarupdate, ImageID(#imgupdatelg), #PB_ToolBar_Normal, update$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarwebsite, ImageID(#imgwebsitelg), #PB_ToolBar_Normal, website$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbarabout, ImageID(#imgaboutlg), #PB_ToolBar_Normal, about$)
  ToolBarSeparator()
  
  ToolBarImageButton(#toolbardonate, ImageID(#imgdonatelg), #PB_ToolBar_Normal, donate$)
  ToolBarSeparator()
  
EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP