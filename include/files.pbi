CompilerIf #PB_Compiler_Processor = #PB_Processor_x64

  Global znsha256$ = "3621349b45ad40a020710607c78e03294b783272240af12a084669478c6a16c6"
  Global znzip$ = "ZeroNet-win-dist-win64.zip"
  Global ipfssha256$ = "f7bbfefa25c3c725158ae66d15ba2be5139fa4a93d2736f80446e0f6157d52ff"
  Global ipfszip$ = "go-ipfs_v0.4.21_windows-amd64.zip"
    
CompilerElse
  
  Global znsha256$ = "11aa3d06cf09f57eb1de1b15763d0a10773cdf77fe8e8f21c780053a345146cc"
  Global znzip$ = "ZeroNet-win-dist.zip"
  Global ipfssha256$ = "07731d13dfc46c023eeef7c5aedba954932f38824a1512f9f428eaf9fa89599b"
  Global ipfszip$ = "go-ipfs_v0.4.21_windows-386.zip"
    
CompilerEndIf

DataSection
   launchera:
     IncludeBinary "..\bin\launcher.exe"
   launcherb:
EndDataSection

DataSection
   sza:
     IncludeBinary "..\bin\7za.exe"
   szb:
EndDataSection

DataSection
   createa:
     IncludeBinary "..\bin\create.bat"
   createb:
EndDataSection

DataSection
  donatea:
  IncludeBinary "..\bin\donate.html"
  donateb:
EndDataSection

DataSection
  icon:
  IncludeBinary "..\bin\images\icon.png"
EndDataSection

DataSection
  encrypted:
  IncludeBinary "..\bin\images\encrypted.png"
EndDataSection

DataSection
  trayicon:
  IncludeBinary "..\bin\images\trayicon.png"
EndDataSection


DataSection
  quit:
  IncludeBinary "..\bin\images\quit.png"
EndDataSection

DataSection
  sync:
  IncludeBinary "..\bin\images\sync.png"
EndDataSection

DataSection
  aboutsm:
  IncludeBinary "..\bin\images\about-16.png"
EndDataSection

DataSection
  aboutlg:
  IncludeBinary "..\bin\images\about-24.png"
EndDataSection

DataSection
  donatesm:
  IncludeBinary "..\bin\images\donate-16.png"
EndDataSection

DataSection
  donatelg:
  IncludeBinary "..\bin\images\donate-24.png"
EndDataSection

DataSection
  settingssm:
  IncludeBinary "..\bin\images\settings-16.png"
EndDataSection

DataSection
  settingslg:
  IncludeBinary "..\bin\images\settings-24.png"
EndDataSection

DataSection
  updatesm:
  IncludeBinary "..\bin\images\update-16.png"
EndDataSection

DataSection
  updatelg:
  IncludeBinary "..\bin\images\update-24.png"
EndDataSection

DataSection
  websm:
  IncludeBinary "..\bin\images\web-16.png"
EndDataSection

DataSection
  weblg:
  IncludeBinary "..\bin\images\web-24.png"
EndDataSection

DataSection
  addsm:
  IncludeBinary "..\bin\images\add-16.png"
EndDataSection

DataSection
  addlg:
  IncludeBinary "..\bin\images\add-24.png"
EndDataSection

DataSection
  removesm:
  IncludeBinary "..\bin\images\remove-16.png"
EndDataSection

DataSection
  removelg:
  IncludeBinary "..\bin\images\remove-24.png"
EndDataSection
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; Folding = +
; EnableXP