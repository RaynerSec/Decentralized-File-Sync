Procedure NoOtherInstance()
  
If PeekL(pbuf+4)=1
  
  MessageRequester("",alreadyrunning$,#PB_MessageRequester_Info)
  End
  
EndIf

  PokeL(pBuf+4,1)
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP