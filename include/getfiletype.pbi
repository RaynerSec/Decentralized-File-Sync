Procedure.s GetFileType(fn$)
    
If SHGetFileInfo_(@fn$, 0, @info.SHFILEINFO, SizeOf(SHFILEINFO), #SHGFI_TYPENAME)
  
  t$ = PeekS(@info\szTypeName[0], -1)
    
EndIf

  ProcedureReturn t$

EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP