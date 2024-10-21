%{
#include <stdio.h>
#include <stdlib.h>

// Function declarations
void yyerror(const char *s);
int yylex(void); // Declare the lexer function
%}

%token LETTER DIGIT

%%

// Define grammar rules
input:
    variable '\n' { printf("Valid variable\n"); }  // Accept valid variable with newline
    | error '\n'  { yyerror("Invalid variable"); }   // Handle error with a newline
    ;

variable:
    LETTER rest { }  // Accept a valid variable
    ;

rest:
    | rest LETTER
    | rest DIGIT
    | /* empty */
    ;

%%

// Main function to run the parser
int main() {
    printf("Enter a variable: ");
    yyparse();
    return 0;
}

// Error handling function
void yyerror(const char *s) {
    printf("Error: %s\n", s); // Provide a meaningful error message
}

