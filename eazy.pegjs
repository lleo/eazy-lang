{

  function p() { console.log.apply(console, arguments) }
  p('********* RESTARTED *********')
  var g = {}
}

start = Expr

ws = "\t" / " "

wsnl = ws / "\n"

_ = ws*

__ = wsnl*


Term = sym:Symbol 
       { return sym } 
     / num:SignedNumericLiteral 
       { return num }

SymbolFirstChar = [_a-zA-Z!@#$%?]

SymbolAnyChar = [_a-zA-Z0-9!@#$%?]

Symbol = fc:SymbolFirstChar rest:SymbolAnyChar* 
         { return { type: "symbol", value: text() } }

SignedNumericLiteral
  = sign:[+-]? _ num:NumericLiteral
    {
      if ("-" == sign) return { type: "number", value: -num.value }
      return num
    }

NumericLiteral "number"
  = hexadecimal:HexadecimalIntegerLiteral
    {
      p('hexadecimal:', hexadecimal)
      return hexadecimal
    }
  / decimal:DecimalLiteral 
    {
      p('decimal:', decimal)
      return decimal
    }

DecimalLiteral
  = DecimalIntegerLiteral "." DecimalDigit* ExponentPart? {
      return { type: "number", value: parseFloat(text()) };
    }
  / "." DecimalDigit+ ExponentPart? {
      return { type: "number", value: parseFloat(text()) };
    }
  / DecimalIntegerLiteral ExponentPart? {
      return { type: "number", value: parseFloat(text()) };
    }

DecimalIntegerLiteral
  = "0"
  / NonZeroDecimalDigit DecimalDigit*

DecimalDigit
  = [0-9]

NonZeroDecimalDigit
  = [1-9]

ExponentPart
  = ExponentIndicator _SignedInteger

ExponentIndicator
  = "e"i

_SignedInteger
  = [+-]? DecimalDigit+

HexadecimalIntegerLiteral
  = "0x0"
    { return { type: "number", value: 0 } }
  / "0x" NonZeroHexadecimalDigit HexadecimalDigit* 
    { 
      p("text():", text())
      p("value:", parseInt(text(), 16))
      return { type: "number", value: parseInt(text(), 16) }
    }

HexadecimalDigit
  = [0-9a-fA-F]

NonZeroHexadecimalDigit
  = [1-9a-fA-F]

Expr = UnarayExpr

UnaryExpr
  = UnaryOper

UnaryOper = "~" / "!" 

AdditiveExpr
  = first:MultiplicativeExpr
    rest:( __ AdditiveOp __ MultiplicativeExpr )*
    {o
      if (isNaN(g['AdditiveExpr']))
        g['AdditiveExpr'] = 1
      p('AdditiveExpr =', g['AdditiveExpr'])
      p("first:", first)
      p("rest:", rest)
      if (rest.length) {
        p("op:", rest[0][1])
        p("lhand:", first)
        p("rhand:", rest[0][3])
        return { type: "additive-expr"
               , op: rest[0][1]
               , lhand: first
               , rhand: rest[0][3] }
      }
      return first
    }

AdditiveOp = "+"
           / "-"

MultiplicativeExpr
  = first:PrimaryExpr
    rest:( __ MultiplicativeOp __ PrimaryExpr )*
    {
      if (isNaN(g['MultiplicativeExpr']))
        g['MultiplicativeExpr'] = 1
      p('MultiplicativeExpr =', g['MultiplicativeExpr'])
      p("first:", first)
      p("rest:", rest)
      if (rest.length) {
        p("op:", rest[0][1])
        p("lhand:", first)
        p("rhand:", rest[0][3])
        return { type: "multiplicative-expr"
               , op: rest[0][1]
               , lhand: first
               , rhand: rest[0][3] }
      }
      return first
    }

MultiplicativeOp = "*" 
                 / "/"

PrimaryExpr = Term
            / "(" expr:Expr ")"
              {
                return expr
              }

Expr = AdditiveExpr 

