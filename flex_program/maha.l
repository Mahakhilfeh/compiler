
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap
%option yylineno

%{
#define MODEL 1
#define TRAIN 2
#define PREDICT 3
#define LEFT_PAREN 4
#define RIGHT_PAREN 5
#define LEFT_CURLY 6
#define RIGHT_CURLY 7
#define ASSIGNMENT 8
#define IDENTIFIER 9
#define L_TYPE 10
#define M_TYPE 11

#define LOSS 13
#define OPTIMIZER 14
#define METRIC 15
#define NUMBER 16

%}

%%
"program"               { printf("A keyword: program\n"); }  
"model"                 { printf("A keyword: model\n"); }
"sequential"            { printf("A model type: sequential\n"); }
"layer"                 { printf("A keyword: layer\n"); }
"type"                  { printf("A keyword: type\n"); }
"in"                    { printf("A keyword: in\n"); }
"out"                   { printf("A keyword: out\n"); }
"input"                 { printf("A layer type: Input\n"); }
"dense"                 { printf("A layer type: Dense\n"); }
"output"                { printf("A layer type: Output\n"); }
"activation"            { printf("A keyword: activation\n"); }
"sigmoid"               { printf("An activation:Sigmoid\n"); }
"tanh"                  { printf("An activation: tanh\n"); }
"relu"                  { printf("An activation: relu\n"); }

"train"                 { printf("A keyword: train\n"); }
"data"                  { printf("A keyword: data\n"); }
"labels"                { printf("A keyword: labels\n"); }
"labels.csv"            { printf("string letral:labels.csv\n"); }
"data.csv"              { printf("string letral: 'data.csv' \n"); }              

"loss"                  { printf("A keyword: loss\n"); }
"mse"                   { printf("A loss: mse\n"); }
"cross_entropy"         { printf("A loss:cross_entropy\n"); }

"optimizer"             { printf("A keyword: optimizer\n"); }
"adam"                  { printf("An optimizer: Adam\n"); }
"rmsprop"               { printf("An optimizer: rmsprop \n"); }
"sgd"                   { printf("An optimizer: sgd\n"); }

"epochs"                { printf("A keyword: epochs\n"); }
"metrics"               { printf("A keyword: metrics\n"); }
"metric"                { printf("A keyword: metric\n   "); }
"accuracy"              { printf("A metric: Accuracy\n"); }
"recall"                { printf("A metric: recall\n"); }

"predict"               { printf("A keyword: predict\n"); }
"test_data.csv"         { printf("string letral: test_data.csv \n"); }
"="                     { printf("An assignment\n"); }
","                     { printf("A comma\n"); }
"("                     { printf("Parentheses: (\n"); }
")"                     { printf("Parentheses: )\n"); }
"{"                     { printf("Curly Braces: {\n"); }
"}"                     { printf("Curly Braces: }\n"); }
\"                      ;
[a-zA-Z_][a-zA-Z0-9_]* { printf("An identifier: %s\n", yytext); }
[0-9]+                  { printf("An Integer:  %s (%s)\n", yytext, yytext);}
[ \t\n]                 ; 
"["                      { printf("brackets: [ \n"); }
"]"                      { printf("brackets: ] \n"); }
.                        { printf("Invalid token: %s\n", yytext); }

%%

int main() {
    FILE *filemaha = fopen("input.txt", "r");
    if (filemaha == NULL) {
        printf("Failed to open the file.\n");
        return 1;
    }

    yyin = filemaha; 

    yylex();

    fclose(filemaha);
    return 0;
}