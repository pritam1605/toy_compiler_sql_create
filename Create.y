/*	Author:Pritam N. Bohra
	Date: 6th Oct,2012
	Program Name: Verifying Create command for SQL
*/

%{
	# include<stdio.h>

%}
%token CREATE TABLE identifier P_KEY field last_P_KEY table_name
%%
command:e { return 0; }    
    ; 

e:CREATE TABLE table_name '('newList')' ';' 
;

newList : field constraint 
	| field constraint ',' newList
	| field constraint ','option
	;

constraint: P_KEY
    |
    ;

option: last_P_KEY
;

%%

main()
{
	printf("\nPlease enter the command to create a table:\n");
	if(yyparse()==0)
	{
		printf("TABLE SUCCESSFULLY CREATED\n");
		 exit(0);
	}
}

yyerror()
{
	printf("\nSyntax Error\n");
}
