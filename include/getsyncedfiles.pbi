Procedure UnlockExistingFiles()

If ExamineDirectory(0,datadir$,"*" + dfs$ )
  
While NextDirectoryEntry(0)
  
If DirectoryEntryType(0) = #PB_DirectoryEntry_File
  
  n$ = DirectoryEntryName(0)
  
  UnLockFile(  datadir$ + n$  )
    
EndIf

Wend

  FinishDirectory(0)

EndIf

EndProcedure
Procedure GetSyncedFiles()
  
  UnlockExistingFiles()
    
ForEach SyncedFiles()
     
 RenameFile(SyncedFiles(), datadir$ + GetFilePart(SyncedFiles()) )
 
 RunProgram(ipfsexe$, ipfspin$ + GetPreferenceString(datadir$ + GetFilePart(SyncedFiles()), sethash$), "", #PB_Program_Hide)
  
 ;Debug GetPreferenceString(datadir$ + GetFilePart(SyncedFiles()), sethash$)
 
Next



  ClearList(SyncedFiles())
  
  ClearGadgetItems(#files)
  
  StatusBarText( #statusbar , 0, "" ,#PB_StatusBar_BorderLess)
  StatusBarText( #statusbar , 1, "" ,#PB_StatusBar_BorderLess)
  
  GetFiles()
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = 9
; EnableXP