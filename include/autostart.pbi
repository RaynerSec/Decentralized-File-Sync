Procedure Autostart(d=0)
  
  a$=Space(#MAX_PATH)
  SHGetSpecialFolderPath_(#Null,a$,#CSIDL_STARTUP,0)
  a$=Trim(a$)
  
  f$=AddBackslash(a$) + dfslauncher$
  
If d=1
  
  DeleteFile(f$)
  
Else
  
  FilePutContents(f$, ?launchera, ?launcherb-?launchera)
  
  AppendToFile(f$,ProgramFilename())
  
EndIf
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP