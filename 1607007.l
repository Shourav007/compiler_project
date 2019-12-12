%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "1607007.tab.h"
%}

alpha [a-zA-Z]

digit [0-9]

keyWord					IF|ELSE|LOOP|RETURN|INTEGER|FLOAT|CHAR|SWITCH|CASE|BREAK|DEFAULT|PF

singleLineComment		[#][a-zA-Z0-9 ]*[^\n]

%%

{digit}+	{ yylval = atoi(yytext); return NUM; }
{alpha}	    { yylval = *yytext - 'a'; return	VAR; }

"{" 		   { return PARENTHESISBEGIN;  }
"}"  		   { return PARENTHESISEND;	}
LOOP 		   { return LOOP;}
SIN			   {return SIN;}
COS            {return COS;}
TAN            {return TAN;}
LOG			   {return LOG;}
LOG10 		   {return LOG10;}
BIGMOD  	   {return BIGMOD;}
SWITCH 		   { return SWITCH; }
PF 		       { return PF; }
CASE   		   { return CASE;  } 
IF 			   { return IF;   }
ELSE 		   { return ELSE; }
BREAK  		   { return BREAK;  }
DEFAULT 	   { return DEFAULT; }

{singleLineComment}		{}
[-+/*<>=,():;%^]     {yylval = yytext[0];	return *yytext;	}
INTEGER  			 {return INT;}
CHAR 		         {return CHAR;}
FLOAT 			 	{return FLOAT;}
"main_FUNCTION "	   { return MAIN; }
[ ]*	    			{}
[\n]*					{}
[\t]*					{}
.						{printf("%s @@@^((( doesnot match with existing rules defined by this compiler yet, please read the manual.....\n",yytext);}


%%
int yywrap()
{
	return 1;
}

int main()
{
	freopen("input2.txt","r",stdin);
	freopen("output.txt","w",stdout);
	yyparse();
    
	return 0;
}