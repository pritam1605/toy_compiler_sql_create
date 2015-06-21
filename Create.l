/*	Author:Pritam N. Bohra
	Date: 6th Oct,2012
	Program Name: Verifying Create command for SQL
*/

%{
	# include "y.tab.h"
	int i=0;
%}
%%
[ \t] {}
[ \n] { yylineno = yylineno + 1;}

(CREATE|Create|create) { return CREATE;}

(TABLE|Table|table) { return TABLE;}

[A-Za-z]+[_]*[a-zA-Z0-9]* { return table_name;}

[A-Za-z]+[_]*[a-zA-Z0-9]*" "(char|varchar|int|number|float|smallint|double|varchar2)"("[0-9]+")" {return field;}

"Constraint "[A-Za-z]+[_]*[a-zA-Z0-9]*" Primary Key" { 	
				if(i==0)
				{
					i=1;
					return P_KEY;
				}
				else
				{
					printf("\nOnly 1 primary key is allowed\n\n");
					exit(0);
				}
			}

" Primary Key" { 	
				if(i==0)
				{
					i=1;
					return P_KEY;
				}
				else
				{
					printf("\nOnly 1 primary key is allowed\n\n");
					exit(0);
				}
			}
"Primary Key("[A-Za-z]+[_]*[a-zA-Z0-9]*")" {
				if(i==0)
				{
					i=1;
					return last_P_KEY;
				}
				else
				{
					printf("\nOnly 1 primary key is allowed\n\n");
					exit(0);
				}
			}
. {return yytext[0];}
%%
