Procedure.s GetPreferenceString(preffile.s, key.s, defaultvalue.s = "")
  
  OpenPreferences(preffile)
  s$ = ReadPreferenceString(key, defaultvalue)
  ClosePreferences()
  
  ProcedureReturn s$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP