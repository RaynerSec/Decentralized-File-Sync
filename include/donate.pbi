Procedure Donate()
  
  If busy = 1
    
    MessageRequester("", pleasewait$)
    ProcedureReturn
    
  EndIf
  
  DisableWindow(#window,1)
  
  wd=640
  he=295

  w = OpenWindow(#PB_Any, 0, 0, wd, he, donate$,   #PB_Window_SystemMenu|#PB_Window_WindowCentered | #PB_Window_Invisible, WindowID(#window)) 
    
If w
  
  FrameGadget(#PB_Any, 0, 0, wd, he, "",#PB_Frame_Flat)
      
  wb=WebGadget(#PB_Any, 1, 1, wd-2, he-82, "") 
  
  FrameGadget(#PB_Any, 0, 0, wd, he-80, "",#PB_Frame_Flat)
  btw=150
  g=ButtonGadget(#PB_Any, wd/2-(btw/2), he-38, btw, 25, ok$)
 
  TextGadget(#PB_Any,1,he-70,wd-2,30,donatetext$,#PB_Text_Center)

  SetGadgetItemText(wb,#PB_Web_HtmlCode,PeekS(?donatea,?donateb-?donatea,#PB_UTF8))
  
  AddKeyboardShortcut(w,#PB_Shortcut_Return,#enter)
  AddKeyboardShortcut(w,#PB_Shortcut_Escape,#escape)
  
  HideWindow(w,0)
  
Repeat 
  
Select WaitWindowEvent()
    
Case #PB_Event_Menu
  
If EventMenu()=#enter Or EventMenu()=#escape
  
  Break
  
EndIf
    
Case #PB_Event_Gadget
  
If EventGadget() = g
  
  Break
  
EndIf
  
Case #PB_Event_CloseWindow
  
  Break
  
EndSelect
    
ForEver

  CloseWindow(w)

EndIf

  DisableWindow(#window,0)

  ProcedureReturn  
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP