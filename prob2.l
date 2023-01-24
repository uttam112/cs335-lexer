%{
#include<bits/stdc++.h>
using namespace std;
map<string,int> mm;
vector<pair<string,string>> v;
int lineNum=1;
%}

D [0-9]
D_ {D}[0-9_]*{D}
DD ({D}|{D_})
E [Ee][+-]?{DD}



H [a-fA-F0-9]
H_ {H}[a-fA-F0-9_]*{H}
HH ({H}|{H_})
P [Pp][+-]?{HH}


B [01]
B_ {B}[01_]*{B}
BB ({B}|{B_})



O [0-7]
O_ [0-7_]*
OO ({O}|{O_})


FD (f|F|d|D)
Ll (l|L)*

L [a-zA-Z_]
LD [a-zA-Z_$0-9]

%%
[\n"\r\n"] {lineNum++;}
[ \t\f\r]+ {}
 
"//".* {}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {{char* s=yytext;char *p=strchr(s,'\n');while(p!=NULL){lineNum++;p=strchr(p+1,'\n');}}}
 
 
 
 
(abstract|continue|for|new|switch|assert|default|if|package)     {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(synchronized|boolean|do|goto|private|this|break|double)         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(implements|protected|throw|byte|else|import|public|throws)      {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(case|enum|instanceof|return|transient|catch|extends|int|short)  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(try|char|final|interface|static|void|class|finally|long)        {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(strictfp|volatile|const|float|native|super|while|_)             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}


 
(exports|opens|requires|uses|module|permits|sealed|var)          {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}
(non-sealed|provides|to|with|open|record|transitive|yield)       {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Keyword"));mm[yytext]++;}





[1-9][0-9_]*[0-9]{Ll}?   {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
[1-9]{Ll}?           {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
{DD}{E}{FD}?                            {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
"0f"                                    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
{DD}*"."{DD}+({E})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
{DD}+"."{DD}*({E})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}


0[xX]{HH}{P}{FD}?  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{HH}+{Ll}?    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{HH}*"."{HH}+({P})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
0[xX]{HH}+"."{HH}*({P})?{FD}?                {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}

0[bB]{BB}{Ll}?    {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}



0{OO}*{Ll}? {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}



"null"                                             {if(mm[yytext]==0)v.push_back(make_pair(yytext,"null"));mm[yytext]++;}
\"([^\\\"]|\\.)*\"                                 {if(mm[yytext]==0)v.push_back(make_pair(yytext,"String"));mm[yytext]++;}
\"\"\"[^"](["][^"]|["]["][^"]|[^"])*\"\"\"         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Text Block"));mm[yytext]++;{char* s=yytext;char *p=strchr(s,'\n');while(p!=NULL){lineNum++;p=strchr(p+1,'\n');}}}
"("|")"|"{"|"}"|"["|"]"|";"|","|"."|"..."|"@"|"::" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Seperator"));mm[yytext]++;}

'(\\.|[^\\'])+'                                  {if(mm[yytext]==0)v.push_back(make_pair(yytext,"char"));mm[yytext]++;}




"="|">"|"<"|"!"|"~"|"?"|":"|"->"|"=="|">="|"<="|"!="|"&&"|"||"|"++" {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}
"--"|"+"|"-"|"*"|"/"|"&"|"|"|"^"|"%"|"<<"|">>"                      {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}
">>>"|"+="|"-="|"*="|"/="|"&="|"="|"^="|"%="|"<<="|">>="|">>>="     {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Operator"));mm[yytext]++;}


"true"|"false"         {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Literal"));mm[yytext]++;}
{L}+{LD}*              {if(mm[yytext]==0)v.push_back(make_pair(yytext,"Identifier"));mm[yytext]++;}
.                      {cerr<<"Error on line "<<lineNum<<" "<<"unidentified :"<<yytext<<"\n";return 0;}

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
