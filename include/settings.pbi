Macro CreateGadgetsAndReadSettings()
  
  h-30
      
  PanelGadget(#panel,2,2,w-4,h-4)
  
  AddGadgetItem(#panel,-1,sync$)
  
  w = GetGadgetAttribute(#panel, #PB_Panel_ItemWidth)
  h = GetGadgetAttribute(#panel, #PB_Panel_ItemHeight)
  
  FrameGadget(#PB_Any, 2,2,w-4,h-4, "",#PB_Frame_Flat)
  
  state = Val (GetPreferenceString(settingsini$, setsync$)) 
  
  es = CheckBoxGadget(#PB_Any,30,20,150,20,enablesync$)
  
  SetGadgetState(es, state)

  s$ = GetPreferenceString(settingsini$, setaddr$)
  pk$ = GetPreferenceString(settingsini$, setpkey$)
  
If s$
  
  s$ = UnObfuscate(s$)
  
EndIf


If pk$
  
  pk$ = UnObfuscate(pk$)
  
EndIf

  TextGadget(#PB_Any, 50,62,60,20, addr$+":")

  StringGadget(#address, 115, 60 , w-150, 20, s$)
  GadgetToolTip(#address, addrinfo$)
  
  TextGadget(#PB_Any, 50, 92,60,20, privkey$+":")
  
  StringGadget(#privatekey, 115, 90 , w-150, 20, pk$, #PB_String_Password)
  GadgetToolTip(#privatekey, pkeyinfo$)
  
If state = 0
  
  DisableGadget(#address,1)
  DisableGadget(#privatekey,1)
  
EndIf
  
  create = ButtonGadget(#PB_Any, 115, 130, 110, 25, createaddress$)
  
  copypkey = ButtonGadget(#PB_Any, 230, 130, 110, 25, copypkey$)
  
  AddGadgetItem(#panel,-1,encryption$)
       
  FrameGadget(#PB_Any, 2,2,w-4,h-4, "",#PB_Frame_Flat)
  
  ee = CheckBoxGadget(#PB_Any,30,20,150,20,enableencryption$)
  
  state = Val (GetPreferenceString(settingsini$, setenc$)) 
  
  SetGadgetState(ee, state)
    
  TextGadget(#PB_Any, 50,62,60,20, password$+":")
  
  StringGadget(#password, 115, 60 , w-150, 20, "",#PB_String_Password)
  
  DisableGadget(#password,1)
  
  GadgetToolTip(#password, passwordinfo$)
  
  GadgetToolTip(ee, encryptioninfo$)
  
  copykey = ButtonGadget(#PB_Any, 115, 100, 130, 25, copykey$)
  
  GadgetToolTip(copykey, encryptkeyinfo$)

If state=1
  
  DisableGadget(#password,0)
  
Else
  
  DisableGadget(copykey, 1)
  
EndIf
  
  AddGadgetItem(#panel,-1,other$)
  
  FrameGadget(#PB_Any, 2,2,w-4,h-4, "",#PB_Frame_Flat)
  
  sww = CheckBoxGadget(#PB_Any,30,20,250,20,startwithwindows$)
  
  TextGadget(#PB_Any,50,60,60,20,timeout$)
  
  tout = SpinGadget(#PB_Any,110,60,80,20,10,600,#PB_Spin_Numeric | #PB_Spin_ReadOnly)
  
  timeo$ = GetPreferenceString(settingsini$, settimeout$, Str(60))
  
  SetGadgetText( tout, timeo$)
  SetGadgetState( tout, Val (timeo$) )
  
  GadgetToolTip(tout, timeoutinfo$)
  
  state = Val( GetPreferenceString(settingsini$, setsww$))
  
  SetGadgetState(sww, state)
  
  GadgetToolTip(sww, autostartinfo$)
      
  CloseGadgetList()
  
  ok = ButtonGadget(#PB_Any, w/2 - 105, WindowHeight(#windowsettings)-30, 110, 25, ok$)
  cancel = ButtonGadget(#PB_Any, w/2 + 10, WindowHeight(#windowsettings)-30, 110, 25, cancel$)
    
  AddKeyboardShortcut( #windowsettings, #PB_Shortcut_Escape,#escape)
  
  l = GetGadgetState(tout)
    
EndMacro
Macro OK()
  
  p$ = hash$ + GetGadgetText(#password)
    
  p$ = ReverseString(p$)
  
  s$ = DESFingerprint(p$, Left(p$,8))
    
If CreatePreferences( settingsini$ )
  
   WritePreferenceString( setenc$ , Str (GetGadgetState(ee) ))
   WritePreferenceString( setsync$ , Str (GetGadgetState(es) ))
      
   p$ = StringFingerprint( p$ + s$,#PB_Cipher_SHA2,512) 
         
   p$ = Obfuscate( p$ )
         
   WritePreferenceString( setek$ , p$ )
   
   a$ = GetGadgetText(#address)
   k$ = GetGadgetText(#privatekey)
   
   sd = CreateThread( @SiteDownload() , @a$ )
   AddElement( Threads() ) : Threads() = sd
   
   WritePreferenceString( setaddr$ , Obfuscate( LSet( a$ , 128) ) )
         
   WritePreferenceString( setpkey$ , Obfuscate( LSet( k$ , 128) ) )
   
   WritePreferenceString( setsww$ , Str (GetGadgetState(sww) ))
   
   WritePreferenceString( settimeout$ , Str (GetGadgetState(tout) ))
   
   ClosePreferences()
   
   timeout = GetGadgetState(tout)
   
EndIf

If GetGadgetState(sww) = #PB_Checkbox_Checked
  
  Autostart()
  
EndIf
  
  CloseWindow(#windowsettings)
  Break
  
EndMacro

Procedure Settings()
  
If busy = 1
    
    MessageRequester("", pleasewait$)
    ProcedureReturn
    
EndIf
  
  w=400 : h=250 
  
If OpenWindow(#windowsettings, 0 , 0, w, h, settings$, #PB_Window_WindowCentered|#PB_Window_MinimizeGadget, WindowID(#window))
  
  CreateGadgetsAndReadSettings()
    
Repeat
    
Select WaitWindowEvent()  
    
Case #PB_Event_Menu
  
If EventMenu() = #escape
  
  CloseWindow(#windowsettings)
  Break 
  
EndIf

Case #PB_Event_Timer
  
If EventTimer() = #timersite
  
If IsThread(thread) = 0
      
  SetGadgetText(#address, siteaddress$)
  SetGadgetText(#privatekey, PrivateKey(siteaddress$))
  
  RemoveWindowTimer(#windowsettings,#timersite)
  DisableGadget(create,0)
  DisableGadget(#panel,0)
  
EndIf
  
EndIf
  
Case #PB_Event_Gadget
  
Select EventGadget()
    
Case tout
  
  state = GetGadgetState(tout)
  
If state <> l
  
  SetGadgetText( tout , Str ( state ) )
    
EndIf

  l = state

Case es
  
If GetGadgetState(es) = #PB_Checkbox_Checked
  
  DisableGadget(#address,0)
  DisableGadget(#privatekey,0)
  
Else
  
  DisableGadget(#address,1)
  DisableGadget(#privatekey,1)
  
EndIf
  
Case create
  
  thread = CreateThread( @CreateSite(), 0)
  AddElement( Threads() ) : Threads() = thread
  
  AddWindowTimer( #windowsettings, #timersite, 1000 )
  DisableGadget(create,1)
  DisableGadget(#panel,1)
  
Case copypkey
  
  key$ = GetPreferenceString(settingsini$, setpkey$)
  key$ = UnObfuscate(key$)
  
  SetClipboardText(key$)
  
  MessageRequester( "" , keycopied$ )
  
  
Case copykey
  
  pw$ = GetPreferenceString(settingsini$, setek$)
  pw$ = UnObfuscate(pw$)
  
  SetClipboardText(pw$)
  
  MessageRequester( "" , keycopied$ )
      
Case ok
    
  OK()

Case ee
  
If GetGadgetState(ee) = #PB_Checkbox_Checked
  
  DisableGadget(#password,0)
  
Else
    
  DisableGadget(#password,1)
  
EndIf
      
Case cancel
    
  CloseWindow(#windowsettings)
  Break
  
EndSelect    
    
Case #PB_Event_CloseWindow
    
  CloseWindow(#windowsettings)
  Break
    
    
EndSelect
  
ForEver
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 5
; EnableXP