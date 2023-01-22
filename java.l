%{
#include<bits/stdc++.h>
using namespace std;
map<string,int> mm;
vector<pair<string,string>> v;
int lineNum=1;
%}

D [0-9]
D_ {D}[0-9_]*{D}
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
P [Pp][+-]?{H}+


%%
[\n"\r\n"] {lineNum++;}
[ \t\f\r]+ {/* eat up whitespace */}
 
"//".* { /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] { /* DO NOTHING */ }
 
 
 
 
(abstract|continue|for|new|switch|assert|default|if|package)     {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(synchronized|boolean|do|goto|private|this|break|double)         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(implements|protected|throw|byte|else|import|public|throws)      {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(case|enum|instanceof|return|transient|catch|extends|int|short)  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(try|char|final|interface|static|void|class|finally|long)        {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(strictfp|volatile|const|float|native|super|while|_)             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}


 
(exports|opens|requires|uses|module|permits|sealed|var)          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(non-sealed|provides|to|with|open|record|transitive|yield)       {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}





[1-9]+[0-9_]*[1-9]+{Ll}?   {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
[1-9][0-9]*{Ll}?           {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}


0[xX]{H}+{H_}*{H}+{Ll}?    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Hex"));mm[yytext]++;}
0[xX]{H}+{Ll}?             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Hex"));mm[yytext]++;}

0[bB]{B}+{B_}*{B}+{Ll}?    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Binary"));mm[yytext]++;}
0[bB]{B}+{Ll}?             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Binary"));mm[yytext]++;}


0{O}+{O_}*{O}+{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Octal"));mm[yytext]++;}
0{O}+{Ll}?          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Octal"));mm[yytext]++;}
0{Ll}?              {if(mm[yytext]==0)v.push_back(make_pair(yytext,"literal"));mm[yytext]++;}


{D}+{E}?{FD}?                         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float literal"));mm[yytext]++;}
{D_}{E}?{D_}?{FD}?                    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float literal"));mm[yytext]++;}
{D}+{E}?{D_}?{FD}?                    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float literal"));mm[yytext]++;}
0[Xx]{H}+{P}?{FD}?                    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"hex literal"));mm[yytext]++;}
0[Xx]{H}+{H_}*{H}+{P}?{FD}?           {if(mm[yytext]==0)v.push_back(make_pair(yytext,"hex literal"));mm[yytext]++;}


{D}*"."{D}+({E})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float"));mm[yytext]++;}
{D}+"."{D}*({E})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"float"));mm[yytext]++;}


0[xX]{H}*"."{H}+({P})?{FD}?                   {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{H}*"."{H}+{H_}*{H}+({P})?{FD}?          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{H}+{H_}*{H}+"."{H}+({P})?{FD}?          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{H}+{H_}*{H}+"."{H}+{H_}*{H}+({P})?{FD}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}


"null"                                             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"null"));mm[yytext]++;}
\"(\\.|[^"\\])*\"                                  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"String"));mm[yytext]++;}
\"\"\"(\\.|[^"\\])*\"\"\"                          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Text Block"));mm[yytext]++;}
"("|")"|"{"|"}"|"["|"]"|";"|","|"."|"..."|"@"|"::" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Seperator"));mm[yytext]++;}

L?'(\\.|[^\\'])+'                                  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"char"));mm[yytext]++;}




"="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}
"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>"                      {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}
">>>"|"+="|"-="|"*="|"/="|"&="|"="|"^="|"%="|"<<="|">>="|">>>="     {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}


"true"|"false"         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
{L}+{LD}*              {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Identifier"));mm[yytext]++;}
.                      {cerr<<"Error on line "<<lineNum<<" "<<"unidentified :"<<yytext<<"\n";}

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
