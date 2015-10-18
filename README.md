# eazy-lang

A procedural language that is easy to type given my keycost analysis
tool (which needs to be published). The basic premise is that moveing
farther away for the base four keypositions and using modifier keys
like shift slows down typeing. So while it is cute to have visually
appealing symbols like "->" in your language it costs more in terms of
typeing speed: "-" is two away from the base-4 and ">" is one away
plus it require a shift modifier. Thinking this way even "{" is more
costly than typeing two letter combos like "do".

So imagine:

    function myfunc(arg0, arg1, arg2) {
      ...
    }

Changing to:

    func myfunc arg0, arg1, arg2 do
      ...
    end

and

    if (val > 10) {
      ...
    }
    else {
      ...
    }

becoming:

    if val > 10 then
      ...
    else
      ...
    end

