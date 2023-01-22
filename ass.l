%{
#include<bits/stdc++.h>
using namespace std;
map<string,int> mm;
vector<pair<string,string>> v;
int lineNum = 1;
%}

let [a-zA-z]
digit [0-9]
%%
[\n] {lineNum++;}
[ \t\v\f]+ {/* eat up whitespace */}
[{][^}]*[}] {}

"+"|"-"|"*"|"/"|":="|"<>"|"<="|">="|"="|"<"|">"|"."|"and"|"or"|"not"|"div"|"mod"|"in"|"^" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}

(array|begin|case|const|do|downto|else|end|file|for|function|goto|if|label|nil|of|packed|procedure|program|record|repeat|set|then|to|type|until|var|while|with) {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}

[(),;:]|("..") {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Seperator"));mm[yytext]++;}
"["|"]" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Seperator"));mm[yytext]++;}
[[:alpha:]][[:alnum:]]* {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Identifier"));mm[yytext]++;}

[0-9]+[[:alpha:]] {printf("Error: not a identifier %d \n",lineNum);return 0;}

[0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
[0-9]+[.][0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
^[-][0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;} /* ^ means only at beginning of a line */
^[-][0-9]+[.][0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
(-?)[0-9]+E(-?)[0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
[0-9]+[.][0-9]+E(-?)[0-9]+ {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
\"(\\.|[^"\\])*\" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"String Literal"));mm[yytext]++;}
. {printf("%s,Error on line %d\n", yytext,lineNum); return 0;}
<<EOF>> {return 0;}
%%


int yywrap(){}
int main(){
FILE *fp;
char filename[50];
printf("Enter the filename: \n");
freopen("pp.csv","w",stdout);
scanf("%s",filename);
fp = fopen(filename,"r");
yyin = fp;
yylex();
cout<<"Lexeme,Token,Count\n";
for(auto i: v){
if(i.first==",")cout<<"\",\""<<","<<i.second<<","<<mm[i.first]<<"\n";
else cout<<i.first<<","<<i.second<<","<<mm[i.first]<<"\n";}


return 0;
}
