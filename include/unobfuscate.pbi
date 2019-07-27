Procedure.s UnObfuscate( string.s )
  
  *CipheredString = AllocateMemory(1000)
  
  r = Base64Decoder(string , *CipheredString, 1000)
  
  *key = UTF8(StringFingerprint(ComputerName(),#PB_Cipher_MD5))
  
  *iv = UTF8(StringFingerprint(ComputerName(),#PB_Cipher_SHA1))
    
  s = r * 2
  
  *DecipheredString = AllocateMemory(s)
  
  AESDecoder(*CipheredString, *DecipheredString, s, *key, 128, *iv)
  
  d$ = PeekS(*DecipheredString, 128)
              
  FreeMemory(*key) :  FreeMemory(*iv)
      
  FreeMemory(*DecipheredString)
  
  ProcedureReturn Trim(d$)
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP