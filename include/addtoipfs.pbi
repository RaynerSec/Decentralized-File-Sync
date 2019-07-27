Procedure AddToIPFS()
 
  flags = #PB_Program_Open|#PB_Program_Read|#PB_Program_Hide 
  
ForEach Files()
  
  good = 0
      
  p = RunProgram(ipfsexe$, LCase( add$ ) + " " + Chr(34) + Encrypt(Files()) + Chr(34), "" ,flags)
  
While ProgramRunning(p)
    
If AvailableProgramOutput(p)
            
   s$ = ReadProgramString(p) 
   
If FindString( s$ , added$, 0, #PB_String_NoCase) 

   result$ = s$
   
   good = 1
   
   done = 1
   
   fp$ = GetFilePart( Files() )
   
   statustext$ = fp$
          
   filetoadd = Files()
   
   Hashes( fp$ ) = Trim ( StringField ( result$ , 2 , " ") )
      
If Val(GetPreferenceString(settingsini$, setenc$))=1
  
  isencrypted = 1
  
  pw$ = GetPreferenceString(settingsini$, setek$)
  pw$ = UnObfuscate(pw$)
    
Else
  
  isencrypted = 0
    
EndIf

If CreatePreferences( datadir$ + fp$ + dfs$ )
      
   WritePreferenceString( sethash$ , Trim ( StringField ( result$ , 2 , " ") ) )
   WritePreferenceString( setsize$ , Str( FileSize(filetoadd) ))
   
   filetoadddate = Date()
   
   WritePreferenceString( setdate$ , Str( filetoadddate ) )
   
   WritePreferenceString( setenc$ , Str( isencrypted ) )
   
   WritePreferenceString( setek$ , StringFingerprint( pw$, #PB_Cipher_SHA2, 256) )
      
   ClosePreferences()
   
   Delay(100)
   
   LockFile( datadir$ + fp$ + dfs$ )
   
EndIf
   
While done = 1
                                    
   Delay(100)
            
Wend
          
  Break
  
EndIf
  
EndIf
  
Wend

  CloseProgram(p)
  
If good = 0
  
If FileExists( Files() )
  
  AddElement( FilesError() )
  FilesError() = Files()
  
EndIf
  
EndIf
  
Next
  
  ProcedureReturn

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP