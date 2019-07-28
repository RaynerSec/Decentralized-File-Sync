#define MyAppName "Decentralized File Sync"
#define MyAppVersion "1.0"
#define MyAppPublisher "Fatih Kodak"
#define MyAppURL "http://127.0.0.1:43110/17SWVnHoujG92yYGSZvCzPgZEpGVfRF8wi"
#define MyAppExeName "Decentralized-File-Sync.exe"

[Setup]

AppId={{18BAC68E-AA5C-48AF-B988-2D68D300D807}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE
OutputBaseFilename=Decentralized-File-Sync-(Installer)
Compression=none
PrivilegesRequired=admin
VersionInfoVersion=1.0.0.0
ArchitecturesInstallIn64BitMode=x64

[Languages]

Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "de"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]

Source: "Decentralized-File-Sync-x64.exe"; DestDir: "{app}"; DestName: "Decentralized-File-Sync.exe"; Check: Is64BitInstallMode

Source: "Decentralized-File-Sync-x86.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
