{
module Parser where

import Lexer
}

%name parser 
%tokentype { Token }
%error { parseError }

%token 
    num     { TokenNum $$ }
    '+'     { TokenPlus }
    '*'     { TokenTimes }
    '('     { TokenLParen }
    ')'     { TokenRParen }

%left '+'
%left '*'

%% 

Exp     : num           { Num $1 }
Exp     : Exp '+' Exp   { Add $1 $3 }
Exp     : Exp '*' Exp   { Times $1 $3 }
Exp     : '(' Exp ')'   { Paren $2 }

{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}