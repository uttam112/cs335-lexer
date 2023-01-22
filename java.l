%{
#include<bits/stdc++.h>
using namespace std;
map<string,int> mm;
vector<pair<string,string>> v;
%}

D [0-9]
D_ [0-9_]
L [a-zA-Z_$]
LD [a-zA-Z_$0-9]
H [a-fA-F0-9]
H_ [a-fA-F0-9_]
B [01]
B_ [01_]
O [0-7]
O_ [0-7_]
E [Ee][+-]?{D}+
FD (f|F|d|D)
Ll (l|L)*


%%

[ \t\n\f\r"\r\n"]+ {/* eat up whitespace */}
 
"//".* { /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] { /* DO NOTHING */ printf("comment\n");}
[/][*] { printf("Error: Unterminated comment\n"); }
 
 
 
 
(abstract|continue|for|new|switch|assert|default|if|package|synchronized|boolean|do|goto|private|this|break|double) {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(implements|protected|throw|byte|else|import|public|throws|case|enum|instanceof|return|transient|catch|extends|int|short) {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(try|char|final|interface|static|void|class|finally|long|strictfp|volatile|const|float|native|super|while|_) {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}


 
(exports|opens|requires|uses|module|permits|sealed|var|non-sealed|provides|to|with|open|record|transitive|yield) {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}




0[xX]{H}+{H_}*{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Hex"));mm[yytext]++;}
0[bB]{B}+{B_}*{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Binary"));mm[yytext]++;}
0{O}+{O_}*{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Octal"));mm[yytext]++;}
[1-9]+{D_}*{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}


{D}+{E}{FD}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"const expo"));mm[yytext]++;}
{D}*"."{D}+({E})?{FD}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float"));mm[yytext]++;}
{D}+"."{D}*({E})?{FD}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float"));mm[yytext]++;}
"null" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"null"));mm[yytext]++;}
\"(\\.|[^"\\])*\" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"String"));mm[yytext]++;}
\"\"\"(\\.|[^"\\])*\"\"\" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Text Block"));mm[yytext]++;}
"("|")"|"{"|"}"|"["|"]"|";"|","|"."|"..."|"@"|"::" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Seperator"));mm[yytext]++;}

L?'(\\.|[^\\'])+' {if(mm[yytext]==0)v.push_back(make_pair(yytext,"char"));mm[yytext]++;}




"="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++"|"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}
">>>"|"+="|"-="|"*="|"/="|"&="|"="|"^="|"%="|"<<="|">>="|">>>=" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}


"true"|"false" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}

{L}+{LD}* {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Identifier"));mm[yytext]++;}

[.]* {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Error"));mm[yytext]++;}

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
for(auto i: v)cout<<i.first<<","<<i.second<<","<<mm[i.first]<<"\n";

return 0;
}
