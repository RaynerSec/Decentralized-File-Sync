Procedure Download()
  
Static a
  
  h$ = GetPreferenceString(temp$ + preferences$, md5$)
  
  n$ = GetPreferenceString(temp$ + preferences$, name$)
  
If FileFingerprint(appdir$ + n$,#PB_Cipher_MD5) <> h$
  
If a<>1
  
If MessageRequester("", downladmsg$, #PB_MessageRequester_YesNo) = #PB_MessageRequester_No
  
  Quit()
  
EndIf    

  a = 1

EndIf
  
  RunProgram(temp$ + downloaderexe$,"",temp$,#PB_Program_Wait)
  
  DeleteFile(temp$ + preferences$)
  
If FileFingerprint(temp$ + n$,#PB_Cipher_MD5) = h$
  
  RenameFile( temp$ + n$, appdir$ + n$ )
  
Else
  
  Quit()
  
EndIf

EndIf

  Unpack(appdir$ + n$)

  DeleteFile(temp$ + preferences$)

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP