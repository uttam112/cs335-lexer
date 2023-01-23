%{
#include<bits/stdc++.h>
using namespace std;
%}

D   [0-9]*
D_ {D}[0-9_]*{D}
DD ({D}|{D_})

%%
[\n] {}
[ \t\v\f]+ {/* eat up whitespace */}
{DD} {printf("decimal number dd  %s\n",yytext);}
{D} {printf("decimal number  %s\n",yytext);}
{D_} {printf("decimal number  %s\n",yytext);}
DD"."DD {printf("floating point\n");}
. {printf("not identified\n");}
%%




int yywrap(){}
int main(){
yylex();
return 0;
}
