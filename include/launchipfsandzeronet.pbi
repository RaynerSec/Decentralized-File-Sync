Procedure LaunchIPFSAndZeroNet()
    
  RunProgram( ipfsexe$, init$, GetPathPart(ipfsexe$), #PB_Program_Wait | #PB_Program_Hide )
  RunProgram( ipfsexe$, daemon$, GetPathPart(ipfsexe$), #PB_Program_Hide )
  
  RunProgram( zeronetexe$, openbrowser$, GetPathPart(zeronetexe$) )
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP