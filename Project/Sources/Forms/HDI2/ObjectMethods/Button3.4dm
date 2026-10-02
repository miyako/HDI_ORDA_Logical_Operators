OBJECT SET TITLE:C194(*; "Operator"; "AND")
OBJECT SET VISIBLE:C603(*; "Hidden_@"; True:C214)


If (btnTrace)
	TRACE:C157
End if 

//Get the intersection of the entity selections Form.eatsMeat and Form.eatsFish
// So get entities belonging to Form.eatsMeat and Form.eatsFish
Form:C1466.result:=Form:C1466.eatsMeat.and(Form:C1466.eatsFish)


