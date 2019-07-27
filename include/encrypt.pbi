Procedure.s Encrypt(f$)
  
If Val(GetPreferenceString(settingsini$, setenc$))=1
  
  pw$ = GetPreferenceString(settingsini$, setek$)
  pw$ = UnObfuscate(pw$)
    
  archive$ = StringFingerprint(f$,#PB_Cipher_MD5) + extsz$
  cmdp$ = szexecmdp$ + pw$
  
  ftp$ = GetShortPath(f$)
    
  UnlockFile(ftp$)
  UnlockFile(szexe$)
    
  RunProgram(szexe$,"a " + archive$ + " " +  ftp$+cmdp$, temp$, #PB_Program_Wait | #PB_Program_Hide )
  
  LockFile(szexe$)
  LockFile(ftp$)
  
  ProcedureReturn temp$+archive$
  
EndIf

  ProcedureReturn f$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP