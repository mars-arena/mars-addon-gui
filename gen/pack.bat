call variables.bat

set target="%root%\dist\umswe.mpq"

copy "%root%\src\umswe.mpq" %target%

start /wait "" %mpq% /add %target% "%root%\src\umswe\UI" "UI" /r /auto

copy %target% "C:\Users\nazarpunk\Desktop\Jass New Gen Pack Rebuild\umswe\umswe.mpq"
