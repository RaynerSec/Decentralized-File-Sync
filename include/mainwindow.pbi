Procedure MainWindow()
  
  w=800:h=450
  
If OpenWindow( #window, 0, 0, w, h, title$+" v"+version$, windowflags)
  
  WindowBounds( #window, w , h , #PB_Ignore, #PB_Ignore )
  
  Images():Menu():Toolbar():StatusBar():TrayIconMenu():PopupMenu()
  
  t = ToolBarHeight(#toolbar)
  
  ListIconGadget(#files,2,t,w-4,h-t-MenuHeight()-StatusBarHeight(#statusbar)-2,filename$,250,#PB_ListIcon_AlwaysShowSelection|#PB_ListIcon_MultiSelect|#PB_ListIcon_FullRowSelect)
  AddGadgetColumn(#files,1,size$,120)
  AddGadgetColumn(#files,2,type$,200)
  AddGadgetColumn(#files,3,dateadded$,150)
    
  EnableGadgetDrop(#files, #PB_Drop_Files, #PB_Drag_Copy)
  
  AddWindowTimer(#window,#timer,100)
  AddWindowTimer(#window,#timerzn,3000)
  AddWindowTimer(#window,#timersync,1000)
  AddWindowTimer(#window,#timerautosync,900000)
  
  GetFiles()
  
  AddKeyboardShortcut(#window,#PB_Shortcut_Control | #PB_Shortcut_A, #selectall)
  AddKeyboardShortcut(#window,#PB_Shortcut_Delete, #remove)
  
  SetWindowCallback(@Callback())
  
If ProgramParameter(0) = cmdhide$
  
    AddSysTrayIcon(#trayicon, WindowID(#window), ImageID(#imgtrayicon) )
    SysTrayIconToolTip(#trayicon, GetWindowTitle(#window) )
    HideWindow(#window,1)
    
 Else
   
  HideWindow( #window, 0 )   
   
EndIf

  CreateThread( @IsZeroNet() , 1 )
 
  
Repeat
  
Select WaitWindowEvent()
    
  Case #updateavailable
    
    StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
    StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
    
    If MessageRequester(update$,updateavailable$,#PB_MessageRequester_Info|#PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
  
      RunProgram( prefix$+webaddr$ )
      
    EndIf
    
  Case #updatefail
    
    StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
    StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
    MessageRequester(update$,updatefail$,#PB_MessageRequester_Error)
    
  Case #noupdates
    
    StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
    StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)  
    MessageRequester(update$,noupdates$,#PB_MessageRequester_Info)
    
  Case #PB_Event_Gadget
    
    If EventGadget() = #files
      
     If EventType() = #PB_EventType_LeftDoubleClick
      
      Doubleclick(1)
      
     EndIf
     
     If EventType() = #PB_EventType_RightClick
      
      RightClick()
      
     EndIf
     
    EndIf
      
  Case #PB_Event_SizeWindow
    
    Resize()
    
  Case #PB_Event_Timer
    
    et = EventTimer()
    
  If et = #timer
        
    Timer()
    
  ElseIf et = #timersync
    
    If ListSize(SyncedFiles())>0
    
      GetSyncedFiles()
    
    EndIf
    
    If busy = - 1
                  
      StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
      StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
      
      busy = 0
      
    EndIf
      
  ElseIf et = #timerzn
    
  If zerorunning = 0
    
    RemoveWindowTimer(#window,#timerzn)
    
  If MessageRequester("", znclosed$, #PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
    
    RunProgram( zeronetexe$, openbrowser$, GetPathPart(zeronetexe$) )
    
    AddWindowTimer(#window,#timerzn,3000)
    
   Else
    
    RemoveWindowTimer(#window,#timerzn)
    
  EndIf
    
  EndIf
  
  ElseIf et = #timerautosync
    
  If busy = 0
    
    Sync(1)
    
  EndIf
    
  EndIf
            
  Case #PB_Event_GadgetDrop
    
  If busy = 1
    
    MessageRequester("", pleasewait$)
        
  Else
    
    f$ = EventDropFiles() 
    
    Count  = CountString(f$, Chr(10)) + 1
  
    filecount = count
  
    StatusBarText( #statusbar , 1, queue$ + " : " + Str(count) , #PB_StatusBar_BorderLess )
    StatusBarImage( #statusbar, 0, ImageID (#imgaddsm) ,#PB_StatusBar_BorderLess)
    
    CreateThread( @EventDrop() , @f$ )
    
  EndIf
                
  Case #PB_Event_SysTray
  
    EventSystray()
    
  Case #PB_Event_CloseWindow
  
    AddSysTrayIcon(#trayicon, WindowID(#window), ImageID(#imgtrayicon) )
    SysTrayIconToolTip(#trayicon, GetWindowTitle(#window) )
    HideWindow(#window,1)
  
  Case #PB_Event_Menu
  
    Event_Menu()
    
EndSelect
    
ForEver
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP