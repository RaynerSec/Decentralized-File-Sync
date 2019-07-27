Procedure Unpack(file$)
  
  CreateDirectory( GetPathPart ( Left(appdir$, Len(appdir$) - 1) ) )
  CreateDirectory( Left(appdir$, Len(appdir$) - 1) )
  
If OpenPack(0,file$, #PB_PackerPlugin_Zip)
 
If ExaminePack(0)
  
While NextPackEntry(0)
  
  t$ = appdir$ + ReplaceString ( PackEntryName(0) , "/", backslash$)
  
  CreateDirectory( GetPathPart( t$ ) )
  
  UncompressPackFile(0, t$)
  
Select GetFilePart ( t$ )
    
Case ipfsexe$
    
  ipfsexe$ = t$
  
Case zeronetexe$
  
  zeronetexe$ = t$
  
Case zeronetcmd$
  
  zeronetcmd$ = t$
  
Default
  
  Delay(1)
  
EndSelect
  
Wend
  
EndIf
    
  ClosePack(0)
    
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP