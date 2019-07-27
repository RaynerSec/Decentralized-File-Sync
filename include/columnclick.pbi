Procedure Callback(Window.l, Message.l, wParam.l, lParam.l)
  
  result = #PB_ProcessPureBasicEvents
 
Select Message
 
Case #WM_NOTIFY
  
  *pnmh.NMHDR = lParam
      
If IsGadget(#files):gid= GadgetID(#files):EndIf
      
If *pnmh\hwndFrom = gid
     
Select *pnmh\code
       
Case #LVN_COLUMNCLICK
  
  *pnmv.NMLISTVIEW = lParam
  Column = *pnmv\iSubItem
    
  SortListIcon(column)
      
EndSelect
     
EndIf
 
EndSelect
 
  ProcedureReturn result
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP