CompilerIf #PB_Compiler_Processor = #PB_Processor_x64

    DataSection
      dla:
        IncludeBinary "..\bin\dl-x64.exe"
      dlb:
    EndDataSection
    
    DataSection
      prefzna:
        IncludeBinary "..\bin\zeronet-x64"
      prefznb:
    EndDataSection
    
    DataSection
      prefipfsa:
        IncludeBinary "..\bin\ipfs-x64"
      prefipfsb:
    EndDataSection
    
CompilerElse
  
    DataSection
      dla:
        IncludeBinary "..\bin\dl-x86.exe"
      dlb:
    EndDataSection
    
    DataSection
      prefzna:
        IncludeBinary "..\bin\zeronet-x86"
      prefznb:
    EndDataSection
    
    DataSection
      prefipfsa:
        IncludeBinary "..\bin\ipfs-x86"
      prefipfsb:
    EndDataSection
    
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
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP