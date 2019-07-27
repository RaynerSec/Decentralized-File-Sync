Procedure.s Obfuscate( text.s )
  
  *u = UTF8(text)
  
  string.s = PeekS(*u, MemorySize(*u) , #PB_UTF8)
  
  *key = UTF8(StringFingerprint(ComputerName(),#PB_Cipher_MD5))
  
  *iv = UTF8(StringFingerprint(ComputerName(),#PB_Cipher_SHA1))
    
  StringMemorySize = StringByteLength(string) + SizeOf(Character)
  
  *CipheredString = AllocateMemory(StringMemorySize)   
  
  AESEncoder(@string, *CipheredString, StringByteLength(string), *key, 128, *iv)
          
  FreeMemory(*key) :  FreeMemory(*iv)
  
  e$ = Base64Encoder(*CipheredString,StringByteLength(string))
    
  FreeMemory(*CipheredString)
      
  ProcedureReturn e$
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP