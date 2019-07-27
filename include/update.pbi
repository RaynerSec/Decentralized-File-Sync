Procedure DL()
 
  download = ReceiveHTTPMemory(updateurl$, #PB_HTTP_Asynchronous)
    
If Download
  
  Repeat
    
    Progress = HTTPProgress(Download)
    
    Select Progress
        
      Case #PB_HTTP_Success
        
        *Buffer = FinishHTTP(Download)
                        
        ProcedureReturn *Buffer

        Case #PB_HTTP_Failed
          
          PostEvent(#updatefail)
          Break

        Case #PB_HTTP_Aborted
          
          PostEvent(#updatefail)
          Break
          
         Default 
           
         If a=>timeout
           
           AbortHTTP(Download)
           Break
           
         EndIf    
             
      EndSelect
      
      Delay(1000)
      a + 1
                 
    ForEver
    
  Else
    
    PostEvent(#updatefail)
    
  EndIf
  
    ProcedureReturn 0
  
  
EndProcedure
Procedure Updt(dl)
  
If dl

While IsThread(dl)
  
  Delay(100)
  
Wend

EndIf

  *download = DL()

If *download = 0
  
  busy = 0
  
  PostEvent(#updatefail)
  ProcedureReturn
  
EndIf
  
  z$ = temp$ + StringFingerprint( Str( Date() ) , #PB_Cipher_MD5 )
  
  FilePutContents( z$, *download, MemorySize( *download ) )
  
If OpenPack(0, z$, #PB_PackerPlugin_Zip)
    
If ExaminePack(0)
  
  NextPackEntry(0)
  s = PackEntrySize(0)
  
If s > 0 And s < 1000
  
  *m = AllocateMemory( s )
  UncompressPackMemory( 0, *m, s )
  
  s$ = PeekS( *m, s, #PB_UTF8 )
  
  FreeMemory(*m)
  
  r = FindString(s$,hash$)
    
If r
  
  g=1
  
  ver$ = Trim(Left(RemoveString(s$,hash$),32))
  
  
If ver$=version$
  
  PostEvent(#noupdates)
  
Else
  
  PostEvent(#updateavailable)
  
EndIf
  
  
Else
  
  PostEvent(#updatefail)
  
EndIf
    
EndIf
          
EndIf
  
  ClosePack(0)
  
Else
  
  PostEvent(#updatefail)
  
EndIf

  DeleteFile(z$)

  busy = 0

  ProcedureReturn
  
EndProcedure
Procedure Update()
 
Static dl
  
If busy = 1
    
    MessageRequester("", pleasewait$)
    ProcedureReturn
    
EndIf

  busy = 1
  
  StatusBarText( #statusbar , 1, checkingforupdates$ , #PB_StatusBar_BorderLess )
  StatusBarImage( #statusbar, 0, ImageID (#imgupdatesm) ,#PB_StatusBar_BorderLess)
  
If dl=0
  
  dl = CreateThread( @SiteDownload() , @webaddr$ )
    
EndIf

  CreateThread( @Updt(), dl )

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 5
; EnableXP