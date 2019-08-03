Procedure Main()
  
If InitNetwork() = 0
  
  MessageRequester("",networkfail$)
  End
  
EndIf    

If ProgramParameter(0) = cmdzeronet$
    
  Download::ZeroNet( ProgramParameter(1) )
  End
  
ElseIf ProgramParameter(0) = cmdipfs$
    
  Download::IPFS( ProgramParameter(1) )
  End
  
EndIf
 
  NoOtherInstance()
  
  CreateDirectory(appdir$) : CreateDirectory(datadir$) : CreateTempDir() : CreateFiles()
  
If IsZeroNetRunning()
  
  MessageRequester("", znalreadyrunning$)
  Quit()
  
EndIf

If Val( GetPreferenceString(settingsini$, setsww$)) = 1

  Autostart()
  
Else
  
  Autostart(1)
  
EndIf

  LaunchIPFSAndZeroNet()
 
  timeout = Val(GetPreferenceString(settingsini$, settimeout$, Str(60)))
  
If timeout < 10
  
  timeout = 10
  
ElseIf timeout > timeoutmax
  
  timeout = timeoutmax
  
EndIf

  zeronetcli$ = GetPathPart(zeronetexe$) + zeronetcli$
      
  MainWindow()
        
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP