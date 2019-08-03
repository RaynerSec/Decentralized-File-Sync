Procedure DownloadZeroNetandIPFS()
  
If FileFingerprint( appdir$ + znzip$ , #PB_Cipher_SHA2, 256 ) <> znsha256$ Or FileFingerprint( appdir$ + ipfszip$ , #PB_Cipher_SHA2, 256 ) <> ipfssha256$
  
If MessageRequester("", downladmsg$, #PB_MessageRequester_YesNo) = #PB_MessageRequester_No
  
  Quit()
  
EndIf    

  RunProgram( ProgramFilename(), cmdipfs$ + " " + Chr(34) + appdir$ + Chr(34) , "", #PB_Program_Wait)
  RunProgram( ProgramFilename(), cmdzeronet$ + " " + Chr(34) + appdir$ + Chr(34), "", #PB_Program_Wait)
      
EndIf
  
If FileFingerprint( appdir$ + znzip$ , #PB_Cipher_SHA2, 256 ) <> znsha256$ Or FileFingerprint( appdir$ + ipfszip$ , #PB_Cipher_SHA2, 256 ) <> ipfssha256$
  
  Quit()
  
EndIf

  Unpack(appdir$ + znzip$)
  Unpack(appdir$ + ipfszip$)
  
EndProcedure 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP