
#Multifunction Calculator

Multifunction Calculator, used Bison, Flex & C++ Libraries

###Features
* Basic arithmetic eg, 5 * (5/2) = 12.5
* Standard function (abs| |)
* Logarithmic function (log10)
* Trig functions (cos, sin, tan)
* Hyperbolic functions (cosh, sinh, tanh)
* Variable stores ( Self-declared variables )
* Hit clear to clear the screen


Functionality:
==============

Binary Operators
---------
```
+        Addition
-        Subtraction
*        Multiplication
/        Divison
%        Modulo (Remainder)
**       raise to the power of...
^^       same as **
&        Logical And
and      same as &
|        Logical Or
or       same as |
^        Logical Exclusive-Or
xor      same as ^
<<       Logical shift left (arithmetic shift for negative numbers)
>>       Logical shift right (arithmetic shift for negative numbers)
```

###Preliminary Installation
* Bison
* Flex
* C++ Compiler
* MAKE Utility

##Usage
With MAKE utility
```
Navigate to the folder
$ make
```
Without MAKE utility
```
Navigate to the folder
bison bison_cal.y
flex flex_cal.l
g++ -w lex.yy.c -o cal
./cal
```