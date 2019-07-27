Macro Event_Menu()

Select EventMenu()
    
  Case #selectall
    
    SelectAll()
    
  Case #toolbarremove,#popupremove,#remove
    
    Remove()
    
  Case #popupshare
    
    Share()
    
  Case #popupopen
    
    Doubleclick(1)
    
  Case #popupdownload
    
    Doubleclick(0)
    
  Case #popupcopy
    
    CopyHash("",hashcopied$)
    
  Case #trayiconquit
  
    Quit()
  
  Case #trayiconrestore
  
    RemoveSysTrayIcon(#trayicon)
    HideWindow(#window,0)
    
  Case #toolbarsettings,#menusettings
  
    Settings()
    
  Case #toolbarsync,#menusync
    
  If busy=1
  
    MessageRequester("", pleasewait$)
    ProcedureReturn
    
  Else
    
    KillThreads()
    KillProcess(zeronetcli$)
    Sync()
    
  EndIf
       
    
  Case #toolbarwebsite,#menuwebsite
  
    RunProgram( prefix$ + webaddr$ )
  
  Case #menuquit
    
    If busy = 1 
      
      If MessageRequester("", quitquestion$, #PB_MessageRequester_YesNo ) = #PB_MessageRequester_Yes
      
        Quit()
        
      EndIf
      
    Else
      
       Quit()
      
    EndIf
      
  Case #menuadd , #toolbaradd
    
  If busy = 1
    
    MessageRequester("", pleasewait$)
    
  Else
    
    a = 0
    f$ = OpenFileRequester(choosefiles$, "", pattern$, 0, #PB_Requester_MultiSelection)
    all$ = ""
    
  If f$
    
  While f$ 
    
    all$ = all$ + f$ + Chr(10)
    f$ = NextSelectedFileName() 
    
    a = a + 1
    
  Wend 
    
    filecount = a
    
    StatusBarText( #statusbar , 1, queue$ + " : " + Str(a) , #PB_StatusBar_BorderLess )
    StatusBarImage( #statusbar, 0, ImageID (#imgaddsm) ,#PB_StatusBar_BorderLess)
    
    CreateThread(@EventDrop(), @all$)
    busy = 1
    
  EndIf
  
  EndIf
  
  Case #menuabout , #toolbarabout
    
    About()
    
  Case #menudonate , #toolbardonate
  
    Donate()
    
  Case #menuupdate , #toolbarupdate
  
    Update()
    
EndSelect

EndMacro
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP