%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token FOR ID NUM EQ SEMI LT GT INC DEC PLUS MINUS TIMES DIV

%%

// Define grammar rules
program:
    program statement
    | /* empty */
    ;

statement:
    for_loop
    | expression SEMI
    ;

for_loop:
    FOR '(' init SEMI condition SEMI increment ')' statement
    ;

init:
    ID EQ NUM
    ;

condition:
    ID LT NUM
    ;

increment:
    ID INC
    ;

expression:
    ID EQ ID PLUS NUM
    ;

%%

// Error handling
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter a 'for' loop:\n");
    yyparse(); // Start parsing
    printf("valid");
    return 0;
}

