Global NewMap PrivateKey.s()
Global NewMap Hashes.s()
Global NewMap LockedFiles()
Global NewMap Renamed.s()

Global NewList Files.s()
Global NewList FilesError.s()
Global NewList AlreadyAdded.s()
Global NewList SyncedFiles.s()
Global NewList Threads()

Global title$ = "Decentralized File Sync"
Global version$ = "1.0"
Global updated$="2019-07-28"
Global copyright$="Copyright (c) 2019 Fatih Kodak"
Global datemask$="%yyyy-%mm-%dd %hh:%ii:%ss"
Global file$ = "File"
Global size$ = "Size"
Global type$ = "Type"
Global dateadded$ = "Date added"
Global add$ = "Add"
Global remove$ = "Remove"
Global settings$ = "Settings"
Global rstr$ = "Restore"
Global quit$ = "Quit"
Global update$ = "Update"
Global website$ = "Website"
Global about$ = "About"
Global donate$ = "Donate"
Global donatetext$ = title$ + " is free - Please donate to support the development!"
Global networkfail$ = "Network initialization failed"
Global open$ = "Open"
Global download$ = "Download"
Global copyhash$ = "Copy hash"
Global share$ = "Share"
Global link$ = "Link"
Global gatewaylink$ = "Gateway link"
Global copylink$ = "Copy"
Global saveas$ = "Save file as..."
Global hashcopied$ = "Hash copied to clipboard"
Global linkcopied$ = "Link copied to clipboard"
Global keycopied$ = "Key copied to clipboard"
Global result$
Global ok$ = "OK"
Global cancel$ = "Cancel"
Global filename$ = "Filename"
Global backslash$ = "\"
Global temp$
Global privatekey$
Global siteaddress$
Global md5$ = "md5"
Global name$ = "saveas"
Global preferences$ = "preferences"
Global createbat$ = "create.bat"
Global downloaderexe$ = "downloader.exe"
Global cmdhide$ = "/hide"
Global szexe$ = "7za.exe"
Global szexecmdp$ = " -mx0 -mhe=on -p"
Global zerorunning
Global zeronetexe$ = "ZeroNet.exe"
Global zeronetcmd$ = "ZeroNet.cmd"
Global znclosed$="Zeronet has been closed. "+Chr(10)+Chr(10)+"Do you want to relaunch it?"
Global openbrowser$ = "--open_browser "+Chr(34)+Chr(34)
Global packfile$ = "files.zip"
Global ipfsexe$ = "ipfs.exe"
Global ipfspin$ = "pin add -r "
Global init$ = "init"
Global daemon$ = "daemon"
Global ipfsrm$ = "pin rm "
Global added$ = "added"
Global temporaryfile$
Global dfs$ = ".dfs"
Global extsz$ = ".7z"
Global appdir$ = GetUserDirectory(#PB_Directory_ProgramData) + title$ + backslash$
Global dt$ = "data"
Global datadir$ = appdir$ + dt$ + backslash$
Global wrongpassword$ = "Wrong password"
Global enterpassword$ = "Enter password"
Global enterpasswordtext$ = "Please enter the correct password to open this file."
Global passwordinfo$ = "The password is used to generate the encryption key."
Global quitquestion$ = "The application is currently busy. Do you want to quit anyway?"
Global removequestion$ = "Remove selected file(s) ?"
Global settingsini$ = appdir$ + "settings.ini"
Global enableencryption$ = "Enable encryption"
Global encryptioninfo$ = "Enabling encryption will put your files in a password protected 7-Zip archive before storing them on the IPFS"
Global encryptkeyinfo$ = "The encryption key is being used to encrypt the files you add to IPFS."
Global enablesyncinfo$ = "Please enable Sync in the settings."
Global enablesync$ = "Enable Sync"
Global password$ = "Password"
Global encryption$ ="Encryption"
Global sync$ ="Sync"
Global other$ ="Other"
Global startwithwindows$ ="Start " + title$ + " with Windows"
Global autostartinfo$ = "This will also launch IPFS and ZeroNet when Windows starts"
Global downladmsg$ = "IPFS and/or ZeroNet needs to be downloaded. Are you okay with that and want to proceed?"
Global pleasewait$ = "Please wait a moment and try again later"
Global copykey$ = "Copy encryption key"
Global copypkey$ = "Copy private key"
Global yes$ = "yes"
Global cmdres$ = "res"
Global znprivatekeys$ = "Site private key"
Global znsiteaddress$ = "Site address"
Global sitesign$ = "siteSign"
Global sitepublish$ = "sitePublish"
Global sitedownload$ = "siteDownload"
Global hideopen = #PB_Program_Hide|#PB_Program_Open
Global windowflags = #PB_Window_ScreenCentered | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget| #PB_Window_SizeGadget | #PB_Window_Invisible
Global ipfsprefix$ = "http://127.0.0.1:8080/ipfs/"
Global ipfsio$ = "https://ipfs.io/ipfs/"
Global prefix$="http://127.0.0.1:43110/"
Global webaddr$="17SWVnHoujG92yYGSZvCzPgZEpGVfRF8wi"
Global updateurl$=prefix$+webaddr$+"/dfs/downloads/v.zip"
Global checkingforupdates$="Checking for updates"
Global noupdates$="You already have the newest version."
Global updateavailable$="A newer version is available."+Chr(10)+Chr(10)+"Download now?"
Global updatefail$="Update check failed"
Global alreadyrunning$ = "An instance of this application is already running"
Global znalreadyrunning$ = "An instance of ZeroNet is already running. Please close it and restart this application."
Global dfslauncher$ = "dfs-launcher.exe"
Global kerneldll$ = "kernel32.dll"
Global cth32snapshot$ = "CreateToolhelp32Snapshot"
Global process32first$ = "Process32First"
Global process32next$ = "Process32Next"
Global hash$ = "391596c073e09acf6ec7e925513294a8"
h$ = "7189d71412304ce524c631d6510b0bb5"
hMapFileb = CreateFileMapping_(#INVALID_HANDLE_VALUE,#Null,#PAGE_READWRITE,0,2000,h$)
Global pBuf = MapViewOfFile_(hMapFileb,#FILE_MAP_ALL_ACCESS,0,0,2000)
Global done
Global busy
Global created
Global threadsync
Global starttime
Global timeout = 60
Global filetoadd.s
Global filetoadddate
Global filecount
Global choosefiles$ = "Choose file(s)"
Global pattern$ = "All files (*.*)|*.*"
Global downloading$ = "Downloading"
Global downloadfailed$ = "Download failed"
Global queue$ = "Adding - Files left"
Global removingfiles$ = "Removing files"
Global syncing$ = "Syncing"
Global timeout$ = "Timeout"
Global timeoutinfo$ = "Wait for the given number of seconds for an async procedure to finish before stopping them"
Global seconds$ = "seconds"
Global alreadyinlist$ = "Already in list"
Global alreadyinlistmsg$ = "The following files are already in the list:"
Global erroraddingfiles$ = "The following files couldn't be added:"
Global createaddress$ = "Create address"
Global addr$ = "Address"
Global privkey$ = "Private key"
Global addrinfo$ = "The ZeroNet address you retrieve data from, and with the matching private key also write data to."
Global pkeyinfo$ = "The private key used to sign and publish sites on ZeroNet. Without one you can only receive, but not send data to your peers."
Global settimeout$ = "timeout"
Global setsww$ = "autostart"
Global setenc$ = "encrypt"
Global sethash$ = "hash"
Global setsize$ = "size"
Global setdate$ = "date"
Global setaddr$ = "addr"
Global setpkey$ = "pkey"
Global setsync$ = "sync"
Global setek$ = "ekey"

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  
  Global zeronetcli$ = "ZeroNet-cli.exe"
  
CompilerElse
  
  Global zeronetcli$ = "ZeroNet.com"
  
CompilerEndIf
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP