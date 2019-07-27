Procedure Quit()
  
  KillThreads()
  KillProcess(zeronetcli$)
  
  DeleteDirectory(temp$,"",#PB_FileSystem_Recursive)

  End
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP