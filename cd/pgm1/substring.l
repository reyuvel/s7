%{
#include <stdio.h>
%}

%%

[a-zA-Z0-9]*abcd[a-zA-Z0-9]* { /* Skip strings with 'abcd' */ }
[a-zA-Z0-9]+ { printf("Recognized string: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

