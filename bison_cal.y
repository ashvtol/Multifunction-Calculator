%{
#include <cstdio>
#include <cstdlib>
#include <string>
#include <iostream>
#include <iomanip>
#include <math.h>
#include <map>
using namespace std; 
map<string,long double> vars; 
void Div0Error(void) {printf("Error: division by zero\n");}
void UnknownVarError(string s) {printf("Error: %s does not exist!\n", s.c_str());} 
void yyerror(string s)
{
  cout << s <<"\n";
} ;

extern "C" int yylex();
%}

%union {
double number; 
string* var;
}



%type <number> expression factor term
%token <var> VAR FUNC
%token <number> NUMBER
%left '+' '-' // left precedence
%left "*" "/"
%%



line: '\n' {cout <<">\t";} line
     | start
     ;

start: expression '\n' { if($1) cout << setprecision(10)<<">\t"<<$1 <<"\n>\t"; else cout <<">\t" ;}  line
     |
     ;


expression: factor
		| VAR  '=' factor       {  
                                 	if(vars[*$1]) {vars[*$1] = $3;  cout <<  setprecision(10) << *$1 << " = " <<vars[*$1] <<" ..........[redefined]\n"; delete $1; $$=0;}
                                    else { vars[*$1] = $3;  cout <<  setprecision(10) << *$1 << " = " <<vars[*$1] <<" ............[defined]\n"; delete $1; $$=0;}
                                }
        | VAR  { if (!vars[*$1]) {UnknownVarError(*$1);$$=0;} else $$ = vars[*$1]; delete $1; } 
        /*count with single argument is used to match*/
        /* { if (!vars.count(*$1)) {UnknownVarError(*$1);$$=0;} else $$ = vars[*$1]; delete $1; } */
        | expression '+' factor { $$ = $1 + $3; }
        | expression '-' factor { $$ = $1 - $3; }
        | '+' factor {$$ = $2;}
        | '-' factor {$$ = -$2;}
        ;


factor: term
          | factor '*' term { $$ = $1 * $3; }
          | factor '/' term { if($3==0) {Div0Error();$$=0;} else $$ = $1 / $3;}
          | factor '^' term { $$ = pow($1,$3); }
          | FUNC '(' expression ')'   {
                                             int num;
                                             if(*$1=="sin") num=1;if(*$1=="cos") num=2;if(*$1=="tan") num=3;if(*$1=="asin") num=4;
                                             if(*$1=="acos") num=5;if(*$1=="atan") num=6;if(*$1=="log") num=7;if(*$1=="exp") num=8;
                                             if(*$1=="sqrt") num=9; 
                                             switch (num)
                                             {
                                                  case 1: $$ = sin($3); break;
                                                  case 2: $$ = cos($3); break;
                                                  case 3: $$ = tan($3); break;
                                                  case 4: $$ = asin($3); break;
                                                  case 5: $$ = acos($3); break;
                                                  case 6: $$ = atan($3); break;
                                                  case 7: $$ = log($3); break;
                                                  case 8: $$ = exp($3); break;
                                                  case 9: $$ = sqrt($3); break;
                                                  default : cout << "Function Not Defined\n\t";
                                             }
                                        }
            
          	;

term: NUMBER
          | '(' expression ')'        { $$ = $2; }
          ;