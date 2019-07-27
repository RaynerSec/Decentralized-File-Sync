Procedure UpdateZIP(v=0)
  
  Delay(v)
  
  s$ = GetPreferenceString(settingsini$, setaddr$)
  pk$ = GetPreferenceString(settingsini$, setpkey$)
  
If s$
  
  s$ = UnObfuscate(s$)
  
  t$ = GetPathPart(zeronetexe$) + dt$ + backslash$ + s$
    
EndIf

If pk$
  
  pk$ = UnObfuscate(pk$)
  PrivateKey(s$) = pk$
  
EndIf

  pfile$ = temp$ + StringFingerprint(Str(Date()) , #PB_Cipher_MD5)

If CreatePack(0, pfile$, #PB_PackerPlugin_Zip)
  
If ExamineDirectory(0,datadir$,"*" + dfs$ )
  
While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  n$ = DirectoryEntryName(0)
  
  AddPackFile(0, datadir$ + n$, n$) 
  
EndIf

Wend

  FinishDirectory(0)
  
EndIf

  ClosePack(0)
  
  DeleteFile(t$ + backslash$ + packfile$)
      
  RenameFile(pfile$, t$ + backslash$ + packfile$)
  
  tr = CreateThread(@SiteSign(), UTF8(s$))
  AddElement( Threads() ) : Threads() = tr
  
  WaitThread(tr)
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP