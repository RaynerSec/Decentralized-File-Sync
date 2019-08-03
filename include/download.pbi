DeclareModule Download
  
  Declare IPFS(dir$)
  Declare ZeroNet(dir$)
    
EndDeclareModule
Module Download
  
UseMD5Fingerprint():UseSHA2Fingerprint()
  
DataSection
  gatewaysa:
    IncludeBinary "../bin/gateways"
  gatewaysb:
EndDataSection

  Global NewList GateWays.s ()
  Global thread
  Global link$
  Global ok
  Global kill
  Global dir$
  Global download$
  Global md5$
  Global sha256$
  Global size
  Global title$
  Global saveas$
  Global width = 340
  Global height = 100
  Global invisible = 0
  Global error$ = "Error"
  Global dlfail$ = "Download failed"
  Global errsave$ = "Unable to save the file"
  Global erric$ = "Integrity check failed"
  Global errnetw$ = "Couldn't initiliaze the network."

Macro DownloadProgress()
  
  p = HTTPProgress(down)
  
Select p
    
Case #PB_HTTP_Failed
  
  Failed()
   
Case #PB_HTTP_Success
  
  CloseWindow(0)
  FinishHTTP(down)
  
  ClearList(GateWays())
  
If  IntegrityCheck(dir$) = 1
  
  ProcedureReturn 
  
EndIf
  
  Break
  
Default
  
  SetGadgetState(1,p)
  
EndSelect
  
EndMacro    
Macro Timer()
  
If EventTimer()=1
  
If kill=1
  Failed()
EndIf
  
If ok=1
  
  RemoveWindowTimer(0,1)
  
  SetGadgetAttribute(1,#PB_ProgressBar_Maximum,size)
  
  down = ReceiveHTTPFile( link$ , dir$ + saveas$ , #PB_HTTP_Asynchronous )
  
  AddWindowTimer(0,2,5)
  
Else
  
If IsThread(t)
  KillThread(t)
EndIf

  NextElement(GateWays())
  t=CreateThread(@GetHeader(),UTF8(GateWays()))
  thread=t
  
EndIf 

ElseIf EventTimer()=2
  
  DownloadProgress()
  
EndIf
  
EndMacro
Procedure MsgBox(mbtitle.s,mbtext.s, f = #PB_MessageRequester_Error)
  
If invisible=0
  
  MessageRequester(mbtitle,mbtext,f)
  
EndIf
  
EndProcedure
Procedure Failed()
  
If IsWindow(0)
  CloseWindow(0)
EndIf

  MsgBox(error$,dlfail$)
   
  End
  
EndProcedure
Procedure IntegrityCheck(dir$)
  
  Delay(500)
  
If FileFingerprint(dir$ + saveas$, #PB_Cipher_SHA2,256) <> sha256$ Or FileFingerprint(dir$ + saveas$, #PB_Cipher_MD5) <> md5$

  MsgBox(error$, erric$)
  
  End
  
Else
  
  ProcedureReturn 1
  
EndIf
  
EndProcedure
Procedure GetSize(l$)
  
Static fail

If fail=>ListSize(GateWays())
  
  kill=1
  ProcedureReturn 0
        
EndIf

  h$ = GetHTTPHeader(l$+download$)
  cl$="Content-Length:"
      
  status$ = StringField( Mid( h$,FindString(h$,"http",0,#PB_String_NoCase ) ) , 1, Chr(10) )
  
If FindString(status$, "200", 0, #PB_String_NoCase) And FindString(status$, "ok", 0, #PB_String_NoCase)
    
  pos = FindString(h$,cl$)
    
If pos
  
  h$ = StringField( Mid(h$,pos) , 1, Chr(10) )
  h$ = Trim( StringField( h$ , 2, ":" ) )
  
  v = Val(h$)
  
EndIf

Else
  
  fail+1
    
EndIf

  ProcedureReturn v
  
EndProcedure
Procedure GetHeader(*a)
  
If GetSize(PeekS(*a,-1,#PB_UTF8)) = size
  
  link$ = PeekS(*a,-1,#PB_UTF8) + download$
 
  ok=1
    
EndIf

  ProcedureReturn

EndProcedure  
Procedure Download(dir$)
  
  FirstElement(GateWays())
    
If OpenWindow(0, 0, 0, width, height, title$, #PB_Window_MinimizeGadget|#PB_Window_SystemMenu | #PB_Window_ScreenCentered | #PB_Window_Invisible)
  
If invisible=0
  
  HideWindow(0,0)
  
EndIf
  
  AddWindowTimer(0,1,1000)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  
  ProgressBarGadget(1,  20, WindowHeight(0) / 2 - 10, WindowWidth(0)-40,  20, 0, 1)
  
CompilerElse
  
  ProgressBarGadget(1,  20, WindowHeight(0) / 2 - 12, WindowWidth(0)-40,  20, 0, 1)
  
CompilerEndIf
  
Repeat
  
Select WaitWindowEvent()
    
Case #PB_Event_Timer
  
  Timer()

Case #PB_Event_CloseWindow
  
  End
  
EndSelect
    
ForEver      
    
EndIf

  ProcedureReturn

EndProcedure
Procedure DL(dir$)
  
If FileFingerprint(dir$ + saveas$, #PB_Cipher_SHA2,256) = sha256$ And FileFingerprint(dir$ + saveas$, #PB_Cipher_MD5) = md5$
  
  ProcedureReturn
  
EndIf

  ok=0:kill=0
  ClearList(GateWays())

i$ = "http://127.0.0.1:8080/ipfs/"
  
  *ipfs = ReceiveHTTPMemory(i$) 
  
If *ipfs

  FreeMemory(*ipfs)
  
  AddElement( GateWays() )
  GateWays() = i$
  
EndIf

  gw$=PeekS(?gatewaysa,?gatewaysb-?gatewaysa,#PB_UTF8)
  
  c=CountString(gw$,Chr(10))
  
For a=1 To c
  
  AddElement( GateWays() )
  GateWays() = StringField(gw$,a,Chr(10))
    
Next

  Download(dir$)
  
EndProcedure
Procedure ZeroNet(dir$)
    
CompilerIf #PB_Compiler_OS = #PB_OS_Windows And #PB_Compiler_Processor = #PB_Processor_x64
  
  download$ = "QmXNHizy5cUWu5ydrTmaRaSgzXgEPUZj24QtQNdPPMkjD5"
  md5$ = "bf04780a88a28be1cc24878b348dd49a"
  sha256$ = "3621349b45ad40a020710607c78e03294b783272240af12a084669478c6a16c6"
  size = 19003316
  title$ = "Downloading - ZeroNet-win-dist-win64.zip"
  saveas$ = "ZeroNet-win-dist-win64.zip"
  
CompilerElseIf #PB_Compiler_OS = #PB_OS_Windows And #PB_Compiler_Processor = #PB_Processor_x86
  
  download$ = "QmdzqDRgUse8KqbYG9FaKDz9uEv523Vp5R2QEECbiCMjU9"
  md5$ = "292ce12d37f2f4cac3d2b61892d57ea7"
  sha256$ = "11aa3d06cf09f57eb1de1b15763d0a10773cdf77fe8e8f21c780053a345146cc"
  size = 16433052
  title$ = "Downloading - ZeroNet-win-dist.zip"
  saveas$ = "ZeroNet-win-dist.zip"
  
CompilerEndIf
  
  DL(dir$)
  
  End
  
EndProcedure
Procedure IPFS(dir$)
  
CompilerIf #PB_Compiler_OS = #PB_OS_Windows And #PB_Compiler_Processor = #PB_Processor_x64
  
  download$ = "Qmf3SxfFABwzSeE2bRtsd9jtumRKij9B9uNpbD4zYkour2"
  md5$ = "ddcc03dc14f929087fcebaccf9d2cac7"
  sha256$ = "f7bbfefa25c3c725158ae66d15ba2be5139fa4a93d2736f80446e0f6157d52ff"
  size = 17813299
  title$ = "Downloading - go-ipfs_v0.4.21_windows-amd64.zip"
  saveas$ = "go-ipfs_v0.4.21_windows-amd64.zip"
  
CompilerElseIf #PB_Compiler_OS = #PB_OS_Windows And #PB_Compiler_Processor = #PB_Processor_x86
  
  download$ = "QmQVEvkRTBHznWQttJR8XM9WsrcehFp4Ev29BxajsbSjaf"
  md5$ = "0623404982399341c3e8f62a5ad4dc36"
  sha256$ = "07731d13dfc46c023eeef7c5aedba954932f38824a1512f9f428eaf9fa89599b"
  size = 17318548
  title$ = "Downloading - go-ipfs_v0.4.21_windows-386.zip"
  saveas$ = "go-ipfs_v0.4.21_windows-386.zip"
  
CompilerEndIf

  DL(dir$)
  
  End
  
EndProcedure

EndModule
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = AAw
; EnableThread
; EnableXP
; Executable = downloader
; CompileSourceDirectory