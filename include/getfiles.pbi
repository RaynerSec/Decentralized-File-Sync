Procedure GetFiles()
  
If ExamineDirectory(0,datadir$,"*" + dfs$ )
  
While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  n$ = DirectoryEntryName(0)
  
  o$ = Left(n$, Len(n$)-4)
    
If Val(GetPreferenceString( datadir$ + o$ + dfs$, setenc$) ) = 1
      
  AddGadgetItem( #files, CountGadgetItems(#files), o$ , ImageID(#imgencrypted))
  
Else

  AddGadgetItem( #files, CountGadgetItems(#files), o$ )
 
EndIf
    
  CopyFile( datadir$ + n$, datadir$ + o$ )
  
  t$ = GetFileType( datadir$ + o$ )
    
  DeleteFile( datadir$ + o$ )
  
  s = Val ( GetPreferenceString(datadir$ + n$, setsize$) )
  
  s$ = FormatByteSize ( s )
  
  SetGadgetItemText( #files, CountGadgetItems(#files) - 1, s$ , 1)
  
  SetGadgetItemData( #files, CountGadgetItems(#files) - 1 , s )
  
  SetGadgetItemText( #files, CountGadgetItems(#files) - 1, t$ , 2)
  
  d$ = FormatDate( datemask$, Val ( GetPreferenceString(datadir$ + n$, setdate$) ) )
  
  SetGadgetItemText( #files, CountGadgetItems(#files) - 1, d$ , 3)
  
  Hashes(o$) = GetPreferenceString(datadir$ + n$, sethash$)
  
  LockFile(datadir$ + n$)
  
EndIf
  
Wend
  
  FinishDirectory(0)
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP