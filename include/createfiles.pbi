Procedure CreateFiles()
  
  FilePutContents(appdir$ + szexe$, ?sza, ?szb-?sza)
  
  szexe$ = appdir$ + szexe$
  
  FilePutContents(temp$ + downloaderexe$, ?dla, ?dlb-?dla)
  
  FilePutContents(temp$ + preferences$, ?prefipfsa, ?prefipfsb-?prefipfsa)
  
  Download()
  
  FilePutContents(temp$ + preferences$, ?prefzna, ?prefznb-?prefzna)
  
  Download()
  
  LockFile(szexe$)
      
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP