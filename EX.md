
Rules
-----

1) Everything is an expression.
2) Newline terminated statements
3) Everything is lexically scoped
?) I would like destructuring


Primatives
----------

binary 0b0001
octal  0o0007
hexadeximal 0x000f

integer /([+-]?[1-9]\d*)/ 
float   /([-+]?[1-9]+(\\.\d*)?([eE][-+]?]\d+)?)/
string  "foo"
symbol /[a-z-A-Z]\w[!?@#$%^&*/
keyword :foo 



Declare variables & values
--------------------------

var x ; declares x as a variables
val x ; declares x as a (set once) constant value

var x = 3, y = 2

Declare clojure scopes:

var x = 3, y = 2 do

end

//207 205 5434

Declare functions
-----------------

val myFunc = fn arg1, arg2 do
  ...

end

or shortcut

func name arg1, arg2 do
  ...
end

val noop = fn do end


Function expressions
--------------------

myFunc a, b, c <newline>
ret = myFunc a, b, c <newline>

myFunc(a, b, c)

ret = myFunc(a, b, c) + myFunc(d, e, f)


Declare methods
---------------

obj.proto.methname = fn arg1, arg2 do ... end

func obj.proto.methname arg1, arg2 do (self) ... end
or?
meth obj.proto.methname arg1, arg2 do (self) ... end


Maps
----

var obj = { key0 val0
          , ...
          , keyn valn }

keys can be numbers, strings, keywords, or objects
values are the same

var o = { :foo 1
        , :bar 2 }

var j = { "one" 1
        , "two" 2 }

o.:foo = 1
o.:bar = 2

j.one = 1
j.two = 2

j["one"] = 1
j["two"] = 2

kw-str := /[a-zA-Z!#$%&*_-=+.?<>]/ ;not @ ^ ( ) | \ , / ` ~

Vectors
-------

var arr = [ elt0, ..., eltn ]

a = [ 1 , 2 , 3 ]
b = [ "one", "two", "three" ]
z = [ 0 , :one, "two" ]



Assignment Expression
---------------------

x = y


Equivalence/Identity
--------------------

x == y ; variable x has the same value as variable y

x = y = new StructY
x === y ; ??? Identity ???



Algerbraic Expressions
----------------------

Multiply : x * y
Divide   : n / d
Add      : a + b
Subtract : b - a
Exponent : x ** n ; x to the nth

String Expressions
------------------

s = "foo"
t = "bar"

s ~ t == "foobar" ; concatenation


Boolean expressions
-------------------

true == 1==1

false == 0==1

val t = true
val f = false
t && f == false
t || f == true


Binary expressions
-------------------
val one = 1
val zero = 0

one & zero == 0
one | zero == 1


Assignment Expressions
----------------------

x = "foo" ; simple assignment

WANT TO HAVE Destructuring

x , y = 1 , 2
x , y = a , b
x , y = y , x
x , y = [ 1 , 2 ]
x , y = { keys a , b  m }; where m = { :a 1, :b 2 }

var (x, y) = (1 , 2)
val (m, n) = (1 , 2)

Control Expressions
-------------------

if x then y end

if x then y else z end

x if y

x unless y


while x do y end

loop do
  x
  break if y
end

===== Typed Easy aka !Easy=====

val name = fn arg1:type1, ..., argn:typen do
  ...
end : type

or

val name fn arg1:type1, ..., argn:typen :: returnType do

end

func name arg1:type1, ..., argn:typen :: returnType do

end
