all : 
	bison bison_cal.y 
	flex flex_cal.l
	g++ -w lex.yy.c -o cal
	rm bison_cal.tab.c lex.yy.c
	./cal
