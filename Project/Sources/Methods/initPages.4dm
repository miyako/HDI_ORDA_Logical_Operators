//%attributes = {}


//Business logic related to ORDA

Form:C1466.students:=ds:C1482.Student.all()
Form:C1466.eatsMeat:=ds:C1482.Student.query("food.meat=:1"; "Yes")
Form:C1466.eatsFish:=ds:C1482.Student.query("food.fish=:1"; "Yes")


OBJECT SET TITLE:C194(*; "Operator"; "")
OBJECT SET VISIBLE:C603(*; "Hidden_@"; False:C215)

btnTrace:=False:C215
