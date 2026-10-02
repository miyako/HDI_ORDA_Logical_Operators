OBJECT SET TITLE:C194(*; "Operator"; "OR")
OBJECT SET VISIBLE:C603(*; "Hidden_@"; True:C214)

If (btnTrace)
	TRACE:C157
End if 

//Get the union of the entity selections Form.eatsMeat and Form.eatsFish
// So get entities belonging to Form.eatsMeat or Form.eatsFish
Form:C1466.result:=Form:C1466.eatsMeat.or(Form:C1466.eatsFish)

