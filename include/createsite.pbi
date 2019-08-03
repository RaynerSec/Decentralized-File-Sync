Procedure CreateSite(var)
  
  created = var
      
  p$ = GetPathPart ( zeronetcmd$ )
  
If CreateFile(0, p$ + yes$)
  
  WriteStringFormat(0,#PB_Ascii)
  WriteString(0, yes$)
  CloseFile(0)
  
EndIf
    
  s$ = ReplaceString ( PeekS(?createa,?createb-?createa,#PB_UTF8), GetFilePart (zeronetcmd$), GetShortPath(zeronetcmd$))
      
  *b = UTF8(s$)
  
  FilePutContents( p$ + createbat$, *b, MemorySize(*b) )  
        
  RunProgram ( p$ + createbat$ , "", p$, #PB_Program_Hide|#PB_Program_Wait)
  
  DeleteFile( p$ + createbat$ )
  
  DeleteFile( p$ + yes$ )
      
If ReadFile(0, p$ + cmdres$)
  
Repeat
  
  s$ = ReadString(0)
  
If FindString ( s$ , znprivatekeys$ )
  
  privatekey$ = Trim ( StringField ( s$, 2, ":") )
  created = 1
  
EndIf

If FindString ( s$ , znsiteaddress$ )
  
  siteaddress$ = Trim ( StringField ( s$, 2, ":") )
      
EndIf

Until Eof(0)

  CloseFile(0)
  
  PrivateKey( siteaddress$ ) = privatekey$
  
EndIf

  DeleteFile( p$ + cmdres$ )
  
  RunProgram( prefix$ + siteaddress$ )
      
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP