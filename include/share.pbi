Procedure Share()
  
  c = CountGadgetItems(#files)
  
For a = 0 To c - 1
  
If GetGadgetItemState(#files,a) = #PB_ListIcon_Selected
  
  h$ = Hashes( GetGadgetItemText(#files,a) )
  Break
  
EndIf
  
Next

  w=380:h=120
  
If OpenWindow(#windowlinks, 0 , 0, w, h, share$, #PB_Window_WindowCentered|#PB_Window_MinimizeGadget, WindowID(#window))
  
  FrameGadget(#PB_Any,5,5,w-10,50,link$)
  link = StringGadget(#PB_Any,15,20,w-80,25, ipfsprefix$ + h$, #PB_String_ReadOnly)
  copylink = ButtonGadget(#PB_Any,w-60,20,50,25, copylink$)
  
  FrameGadget(#PB_Any,5,60,w-10,50,gatewaylink$)
  glink = StringGadget(#PB_Any,15,75,w-80,25, ipfsio$ + h$, #PB_String_ReadOnly)
  copyglink = ButtonGadget(#PB_Any,w-60,75,50,25, copylink$)
    
  AddKeyboardShortcut(#windowlinks,#PB_Shortcut_Escape,#escape)
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_Menu
  
If EventMenu()=#escape
  
  CloseWindow(#windowlinks)
  Break
  
EndIf
    
Case #PB_Event_Gadget
  
Select EventGadget()
    
Case copylink
    
  SetClipboardText( GetGadgetText(link) )
  MessageRequester("", linkcopied$)
  
Case copyglink
    
  SetClipboardText( GetGadgetText(glink) )
  MessageRequester("", linkcopied$)
  
EndSelect
  
Case #PB_Event_CloseWindow
  
  CloseWindow(#windowlinks)
  Break
    
EndSelect

ForEver

EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP