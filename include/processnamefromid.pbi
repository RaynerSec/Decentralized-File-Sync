Procedure.s ProcessNameFromID(ProcessID)
  
  Protected   ProcessName.s   =   Space(#MAX_PATH)
  
  If  OpenLibrary(0, "psapi.dll")
    
    EnumProcessModules  =   GetFunction(0, "EnumProcessModules")
    GetModuleFileNameEx =   GetFunction(0, "GetModuleFileNameExW")
    
    hProcess    =   OpenProcess_(#PROCESS_QUERY_INFORMATION|#PROCESS_VM_READ, 0, ProcessID)
    
    CallFunctionFast(EnumProcessModules, hProcess, @hModule, 1, 0)
    CallFunctionFast(GetModuleFileNameEx, hProcess, hModule, @ProcessName, #MAX_PATH)
    
    CloseHandle_(hProcess)
    CloseLibrary(0)
    
  EndIf
  
  ProcedureReturn ProcessName
  
EndProcedure 
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP