Procedure Timer()
 
If IsThread(threadsync)
  
If Date()-starttime > timeout
  
If MapSize(Renamed())>0
  
  k$ = MapKey(Renamed())
  d$ = Renamed(k$)
  
  DeleteDirectory( k$, "")
  
  RenameFile( d$, k$ )
  
  ClearMap(Renamed())
  
EndIf
  
  StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
  
  KillThread(threadsync)
  KillThreads()
  
  busy = 0
    
  starttime = 0
  
  KillProcess(zeronetcli$)
      
EndIf
  
EndIf
  
If done = 1
  
  filecount = filecount - 1
  
If Val(GetPreferenceString( datadir$ + GetFilePart(filetoadd) + dfs$, setenc$) ) = 1
  
  AddGadgetItem( #files, CountGadgetItems(#files), GetFilePart(filetoadd), ImageID(#imgencrypted))
  
Else
  
  AddGadgetItem( #files, CountGadgetItems(#files), GetFilePart(filetoadd))
  
EndIf
  
  SetGadgetItemText( #files, CountGadgetItems(#files)-1 , FormatByteSize(FileSize(filetoadd)), 1 )
  SetGadgetItemText( #files, CountGadgetItems(#files)-1 , GetFileType( filetoadd ), 2 )
  SetGadgetItemText( #files, CountGadgetItems(#files)-1 , FormatDate( datemask$, filetoadddate ), 3 )
  SetGadgetItemData( #files, CountGadgetItems(#files)-1, FileSize(filetoadd))
  
  WindowEvent()
  
If filecount > 0
  
  StatusBarImage( #statusbar, 0, ImageID (#imgaddsm) ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, queue$ + " : " + Str( filecount ) , #PB_StatusBar_BorderLess )
  
EndIf
  
  done = 0
  
EndIf

If done = 2
  
  StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
  
  KillProcess(zeronetcli$)
  
If ListSize( FilesError() ) > 0
  
ForEach FilesError()
  
  s$ = s$ + "  " +  FilesError() + Chr(10)
  
Next

  ClearList( FilesError() )
  MessageRequester( "" , erroraddingfiles$ + Chr(10) + Chr(10) + s$, #PB_MessageRequester_Error )
  s$=""
  
EndIf

If ListSize( AlreadyAdded() ) > 0
  
ForEach AlreadyAdded()
  
  s$ = s$ + "  " + GetFilePart ( AlreadyAdded() ) + Chr(10)
  
Next

  ClearList( AlreadyAdded() )
  MessageRequester( alreadyinlist$ , alreadyinlistmsg$ + Chr(10) + Chr(10) + s$, #PB_MessageRequester_Info )
  s$=""
  
EndIf

  done= 0
  ClearList( Files() )
  
  uz = CreateThread(@UpdateZIP(),0)
  AddElement( Threads() ) : Threads() = uz
  
While IsThread(uz)
  WindowEvent()
  Delay(5)
Wend
  
EndIf

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP