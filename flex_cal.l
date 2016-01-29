%{
#include "bison_cal.tab.c"
%}

%option noyywrap
%option always-interactive

%%
[ \t]  {}
([0-9]+|[0-9]+"."[0-9]*)     { yylval.number = atof(yytext); return NUMBER; }
stop|exit|STOP|QUIT|quit|EXIT {cout << "Termination Program ......done\n";exit(0);}
clear|CLEAR {cout << "\033[2J\033[1;1H";}
sin|cos|tan|atan|asin|acos|log|exp|sqrt|abs { yylval.var =  new string(yytext); return FUNC;}
[a-zA-Z][a-zA-Z0-9]*      { yylval.var = new string(yytext); return VAR; }
[-|+|*|/|\n|=|(|)|^] { return *yytext; }
.          yyerror("Unknown character");
%%

int main() 
{	
	cout << "###############################################\n";
	cout << "#            Calulator v1.0.2                 #\n";
	cout << "#         -> By Ashish  Kumar                 #\n";
	cout << "###############################################\n";
	cout << ">\t";
	yyparse();
	return 0;
}
