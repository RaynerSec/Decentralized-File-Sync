Procedure DownloadFromIPFS( name.s, url.s, s, run )
  
  temporaryfile$ = ""
  
If Val(GetPreferenceString(datadir$ + name.s + dfs$, setenc$)) = 1
  
  h$ = GetPreferenceString(datadir$ + name.s + dfs$, setek$)
  
  pw$ = GetPreferenceString(settingsini$, setek$)
  
  pw$ = UnObfuscate(pw$)
  
If StringFingerprint( pw$, #PB_Cipher_SHA2, 256) = h$
  
  decrypt = 1
  
Else
  
  i$ = InputRequester(enterpassword$, enterpasswordtext$ , "" , #PB_InputRequester_Password)
  
If i$
  
  p$ = hash$ + i$
  p$ = ReverseString(p$)
  s$ = DESFingerprint(p$, Left(p$,8))
  
  pw$ = StringFingerprint( p$ + s$,#PB_Cipher_SHA2,512) 
      
  pwh$ = StringFingerprint( pw$, #PB_Cipher_SHA2, 256)
    
If pwh$<>h$
  
  MessageRequester( "", wrongpassword$, #PB_MessageRequester_Error)
  
  ProcedureReturn
  
EndIf

  decrypt = 1

Else
  
  ProcedureReturn
  
EndIf
  
EndIf
    
EndIf
  
If run <> 1
  
  sv$ = SaveFileRequester(saveas$, name, pattern$, 0)
  
If sv$=""
  
  ProcedureReturn
  
EndIf
  
EndIf
  
  dl = ReceiveHTTPMemory(url, #PB_HTTP_Asynchronous)
  
  w=320:h=90
  
If OpenWindow(#windowdownload, 0 , 0, w, h, downloading$ + " - " + name, #PB_Window_WindowCentered|#PB_Window_MinimizeGadget, WindowID(#window))
  
  ProgressBarGadget(#progressbar, 10, h/2 - 15, w-20, 30, 0, s)
  
  AddWindowTimer(#windowdownload, #timerdl , 100)
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_Timer
  
If EventTimer() = #timerdl
  
 Progress = HTTPProgress(dl)
 
Select Progress
    
Case #PB_HTTP_Success
  
  SetGadgetState(#progressbar, s)
  
  *Buffer = FinishHTTP(dl)
    
If decrypt = 1
  
   res = Decrypt(*Buffer, MemorySize(*Buffer), pw$ , name)
   
If res = -1
   
    CloseWindow(#windowdownload)
    Break
    
EndIf
    
EndIf
  
If run = 1
  
If temporaryfile$

    RunProgram( temporaryfile$ )
    CloseWindow(#windowdownload)
    
Else
  
    t$ = StringFingerprint(Str(Date()) , #PB_Cipher_MD5)
    
    CreateDirectory( temp$ + t$ )
    
    FilePutContents( temp$ + t$ + backslash$ + name , *Buffer , MemorySize(*Buffer) )
    
    FreeMemory(*Buffer)
    
    CloseWindow(#windowdownload)
    
    RunProgram( temp$ + t$ + backslash$ + name )
    
EndIf
    
Else
  
If temporaryfile$
  
    RenameFile(temporaryfile$, sv$)
    CloseWindow(#windowdownload)
    
Else
  
    FilePutContents( sv$ , *Buffer , MemorySize(*Buffer) )
    
    FreeMemory(*Buffer)
      
    CloseWindow(#windowdownload)
    
EndIf
    
EndIf
    
    Break

  
Case #PB_HTTP_Failed
  
    CloseWindow(#windowdownload)
    MessageRequester("", downloadfailed$)
    Break

Case #PB_HTTP_Aborted
  
    CloseWindow(#windowdownload)
    Break
          
Default
  
  SetGadgetState(#progressbar, Progress)
         
EndSelect
  
  
EndIf
  
Case #PB_Event_CloseWindow    
  
  AbortHTTP(dl)
  
  CloseWindow(#windowdownload)
  Break
  
EndSelect
    
ForEver
  
EndIf

  ProcedureReturn

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP