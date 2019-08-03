Procedure Syncing(v)
  
  Delay(v)
  
  s$ = GetPreferenceString(settingsini$, setaddr$)
  
If s$
  
  s$ = UnObfuscate(s$)
  
  dir$ = AddBackslash(GetPathPart(zeronetexe$)) + dt$ + backslash$
  
  n$ = dir$ + n$ + StringFingerprint( Str( Date() ) , #PB_Cipher_MD5)
  
  RenameFile( dir$ + s$ , n$ )
  
  Renamed( dir$ + s$ ) = n$
  
  *u = UTF8(s$)
  
  s$ = PeekS( *u , MemorySize(*u), #PB_UTF8)
  
  FreeMemory(*u)
  
If SiteDownload(@s$) = 1
  
  DeleteDirectory(n$,"")
  
  ClearMap( Renamed() )
  
Else

  RenameFile( n$ , dir$ + s$ )
  
  busy = 0
  ProcedureReturn
  
EndIf
  
  *m = ReceiveHTTPMemory(prefix$ + s$ + backslash$ + packfile$)
  
If *m
  
  f$ = temp$ + StringFingerprint(Str(Date()) , #PB_Cipher_MD5)
    
  s=MemorySize(*m)
  
  FilePutContents(f$, *m, s)
  
If OpenPack(1, f$)
  
  t$ = temp$ + StringFingerprint(Str(Date())+title$ , #PB_Cipher_MD5)
  
  CreateDirectory(t$)
  
  t$ = AddBackslash(t$)
  
If ExaminePack(1)
  
  While NextPackEntry(1)
            
    UncompressPackFile(1, t$ + PackEntryName(1))
    
    AddElement(SyncedFiles())
    SyncedFiles() = t$ + PackEntryName(1)
    
  Wend
        
EndIf

  ClosePack(1)

EndIf

  FreeMemory(*m)
  
  DeleteFile(f$)
  
EndIf
    
EndIf

  busy = -1

EndProcedure
Procedure Sync( auto = 0 )
  
If auto = 1 
  
If Val (GetPreferenceString(settingsini$, setautosync$)) = 0 Or Val (GetPreferenceString(settingsini$, setsync$)) = 0
  
  ProcedureReturn
  
EndIf
  
EndIf
  
If  Val (GetPreferenceString(settingsini$, setsync$)) = 1
  
  StatusBarImage( #statusbar, 0, ImageID (#imgtrayicon) ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, syncing$ ,#PB_StatusBar_BorderLess)
  starttime = Date()
  busy = 1
  threadsync = CreateThread(@Syncing(), 100)
  AddElement( Threads() ) : Threads() = threadsync
    
ElseIf auto = 0
  
  MessageRequester("",enablesyncinfo$)
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP