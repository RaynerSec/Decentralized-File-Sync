Procedure CreateFiles()
  
  FilePutContents(appdir$ + szexe$, ?sza, ?szb-?sza)
  
  szexe$ = appdir$ + szexe$
  
  DownloadZeroNetandIPFS()
  
  LockFile(szexe$)
      
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP