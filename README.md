A simple ruby based `Calculation` Parser / Interpreter.

Implemented as per @jamis's ["Weekly Programming Challenge #8"](http://weblog.jamisbuck.org/2016/9/17/weekly-programming-challenge-8.html)

```
expression = term expr-op ;
expr-op    = '+' expression
           | '-' expression
           | () ;

term    = factor term-op ;
term-op = '\*' term
        | '/' term
        | () ;

factor = integer
       | '(' expression ')'
       | '-' factor ;

integer = '0' | '1' | '2' | '3' | '4'
        | '5' | '6' | '7' | '8' | '9' ;
```
