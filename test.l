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
0x1p3
/*
0x1p3
0x7fff_ffff
0177_7777_7777
0b0111_1111_1111_1111_1111_1111_1111_1111
0x8000_0000
0200_0000_0000
0b1000_0000_0000_0000_0000_0000_0000_0000
0x7fff_ffff_ffff_ffffL
07_7777_7777_7777_7777_7777L
0b0111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111L


    0x8000_0000_0000_0000L
    010_0000_0000_0000_0000_0000L
    0b1000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000L
0xffff_ffff_ffff_ffffL
017_7777_7777_7777_7777_7777L
0b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111L
0    2    0372    0xDada_Cafe    1996    0x00_FF__00_FF
0l    0777L    0x100000000L    2_147_483_648L    0xC0B0L  3.4028235e38f  0x1.fffffeP+127f  1.4e-45f   0x0.000002P-126f   0x1.0P-149f    1.7976931348623157e308 

 0x1.f_ffff_ffff_ffffP+1023      4.9e-324     0x0.0_0000_0000_0001P-1022       0x1.0P-1074   1e1f    2.f    .3f    0f    3.14f    6.022137e+23f 
    1e1    2.    .3    0.0    3.14    1e-9d    1e137*/
    }
