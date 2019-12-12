flex 1607007.l
bison -d 1607007.y
gcc 1607007.tab.c lex.yy.c -o app
app
pause