Procedure SortListIcon(column)
  
Static lc,lf

If column=lc
  
  flag = #PB_Sort_Descending
  
If lf = #PB_Sort_Descending
  
  flag = #PB_Sort_Ascending
  
Else
  
  flag = #PB_Sort_Descending
  
EndIf
  
Else
  
  flag = #PB_Sort_Ascending
  
EndIf
  
Structure LIcon
  
  name.s
  size.s
  s.i
  type.s
  date.s
  
EndStructure

NewList L.Licon()

  c=CountGadgetItems(#files)

For a=0 To c-1
  
  AddElement(L())
  L()\name = GetGadgetItemText(#files,a,0)
  L()\size = GetGadgetItemText(#files,a,1)
  L()\s = GetGadgetItemData(#files,a)
  L()\type = GetGadgetItemText(#files,a,2)
  L()\date = GetGadgetItemText(#files,a,3)
 
Next

Select column
    
Case 0
  
  SortStructuredList( L() , flag , OffsetOf(Licon\name) , TypeOf(Licon\name))  
  
Case 1

  SortStructuredList( L() , flag , OffsetOf(Licon\s) , TypeOf(Licon\s)) 
  
Case 2
  
  SortStructuredList( L() , flag , OffsetOf(Licon\type) , TypeOf(Licon\type)) 
  
Case 3
  
  SortStructuredList( L() , flag , OffsetOf(Licon\date) , TypeOf(Licon\date)) 
  
EndSelect

  ClearGadgetItems(#files)

ForEach L()
  
If Val(GetPreferenceString( datadir$ + GetFilePart(L()\name) + dfs$, setenc$) ) = 1
  
  AddGadgetItem(#files,i,L()\name, ImageID(#imgencrypted))
  
Else
  
  AddGadgetItem(#files,i,L()\name)
  
EndIf
  
  
  SetGadgetItemText(#files,i,L()\size,1)
  SetGadgetItemText(#files,i,L()\type,2)
  SetGadgetItemData(#files,i,L()\s)
  SetGadgetItemText(#files,i,L()\date,3)
  
  i+1
  
Next

  lc=column
  lf=flag
  
EndProcedure
; IDE Options = PureBasic 5.70 LTS (Windows - x64)
; Folding = +
; EnableXP