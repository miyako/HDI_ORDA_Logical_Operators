OBJECT SET TITLE:C194(*; "Operator"; Localized string("OperatorMinus"))
OBJECT SET VISIBLE:C603(*; "Hidden_@"; True:C214)


If (Form:C1466.trace)
	TRACE:C157
End if 

//Get the difference of the entity selections Form.eatsMeat and Form.eatsFish
// So get entities belonging to Form.eatsMeat and not to Form.eatsFish
Form:C1466.result:=Form:C1466.eatsMeat.minus(Form:C1466.eatsFish)

