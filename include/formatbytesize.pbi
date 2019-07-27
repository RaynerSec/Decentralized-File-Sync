Procedure.s FormatByteSize(n)
  
  v=1000
  
If n=>v And n < v*v
 
  retval.f=n/v
  retval$ = StrF(retval, 2)+" KB"

ElseIf n< v
  
    retval$ = Str(n)+" Bytes"

ElseIf n => (v*v) And n< v*v*v

  retval.f=n/(v*v)
  retval$ = StrF(retval, 2)+" MB"

ElseIf n => (v*v*v)

  retval.f=n/(v*v*v)
  retval$ = StrF(retval, 2)+" GB"

EndIf

  ProcedureReturn retval$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP