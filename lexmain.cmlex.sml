(*

lexmain
initial state = 18
total states = 27

-----

lexmain
state 17 (final:slash):

42 => state 14   (sink:lcomment)

-----

lexmain
state 18 (initial, final:error):

9-10 => state 19   (final:skip)
13 => state 19   (final:skip)
32 => state 19   (final:skip)
34 => state 24
38 => state 3   (sink:ampersand)
39 => state 25
40 => state 2   (sink:lparen)
41 => state 13   (sink:rparen)
42 => state 23   (final:star)
43 => state 6   (sink:plus)
45 => state 4   (sink:minus)
47 => state 17   (final:slash)
48-57 => state 20   (final:number)
58 => state 12   (sink:colon)
61 => state 22   (final:equal)
62 => state 26
63 => state 10   (sink:question)
65-90 => state 21   (final:ident)
97-122 => state 21   (final:ident)
124 => state 9   (sink:bar)
126 => state 15   (sink:tilde)
EOS => state 16   (sink:eof)

-----

lexmain
state 19 (final:skip):

9-10 => state 19   (final:skip)
13 => state 19   (final:skip)
32 => state 19   (final:skip)

-----

lexmain
state 20 (final:number):

48-57 => state 20   (final:number)

-----

lexmain
state 21 (final:ident):

39 => state 21   (final:ident)
48-57 => state 21   (final:ident)
65-90 => state 21   (final:ident)
95 => state 21   (final:ident)
97-122 => state 21   (final:ident)

-----

lexmain
state 22 (final:equal):

62 => state 5   (sink:arrow)

-----

lexmain
state 23 (final:star):

42 => state 7   (sink:starstar)

-----

lexmain
state 24:

0-33 => state 24
34 => state 1   (sink:string)
35-127 => state 24

-----

lexmain
state 25:

33-126 => state 11   (sink:char)

-----

lexmain
state 26:

61 => state 8   (sink:geq)

=====

skipcomment
initial state = 5
total states = 7

-----

skipcomment
state 4 (final:comment_skip):

42 => state 3   (sink:comment_open)

-----

skipcomment
state 5 (initial, final:comment_error):

0-41 => state 1   (sink:comment_skip)
42 => state 6   (final:comment_skip)
43-46 => state 1   (sink:comment_skip)
47 => state 4   (final:comment_skip)
48-127 => state 1   (sink:comment_skip)

-----

skipcomment
state 6 (final:comment_skip):

47 => state 2   (sink:comment_close)

*)

functor LexMainFun (structure Streamable : STREAMABLE
structure Arg : sig
type symbol
val ord : symbol -> int
type t
type u
val ampersand : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val arrow : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val bar : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val char : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val colon : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val comment_close : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> u
val comment_error : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> u
val comment_open : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> u
val comment_skip : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> u
val eof : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val equal : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val error : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val geq : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val ident : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val lcomment : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val lparen : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val minus : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val number : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val plus : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val question : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val rparen : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val skip : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val slash : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val star : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val starstar : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val string : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
val tilde : { match : symbol list, len : int, start : symbol Streamable.t, follow : symbol Streamable.t, self : {lexmain : symbol Streamable.t -> t, skipcomment : symbol Streamable.t -> u} } -> t
end)
=
struct
local
structure LexEngine = LexEngineFun (structure Streamable = Streamable
type symbol = Arg.symbol
val ord = Arg.ord)
structure Tables = struct
fun error _ = raise (Fail "Illegal lexeme")
val lexmain = (18, 16, 23, Vector.fromList [Arg.string,Arg.lparen,Arg.ampersand,Arg.minus,Arg.arrow,Arg.plus,Arg.starstar,Arg.geq,Arg.bar,Arg.question,Arg.char,Arg.colon,Arg.rparen,Arg.lcomment,Arg.tilde,Arg.eof,Arg.slash,Arg.error,Arg.skip,Arg.number,Arg.ident,Arg.equal,Arg.star], LexEngine.next7x1 128 "\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^N\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^S\^S\^@\^@\^S\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^S\^@\^X\^@\^@\^@\^C\^Y\^B\r\^W\^F\^@\^D\^@\^Q\^T\^T\^T\^T\^T\^T\^T\^T\^T\^T\f\^@\^@\^V\^Z\n\^@\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^@\^@\^@\^@\^@\^@\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^@\t\^@\^O\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^S\^S\^@\^@\^S\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^S\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^T\^T\^T\^T\^T\^T\^T\^T\^T\^T\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^U\^@\^@\^@\^@\^@\^@\^@\^@\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^@\^@\^@\^@\^@\^@\^@\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^@\^@\^@\^@\^U\^@\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^U\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^E\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\a\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^A\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^X\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\v\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\b\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@", LexEngine.next0x1 "\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^P\^@\^@\^@\^@\^@\^@\^@\^@")
val skipcomment = (5, 3, 6, Vector.fromList [Arg.comment_skip,Arg.comment_close,Arg.comment_open,Arg.comment_skip,Arg.comment_error,Arg.comment_skip], LexEngine.next7x1 128 "\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^C\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^F\^A\^A\^A\^A\^D\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^A\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^B\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@\^@", LexEngine.next0x1 "\^@\^@\^@\^@\^@\^@\^@")
end
in
fun lexmain s = LexEngine.lex {lexmain=lexmain, skipcomment=skipcomment} Tables.lexmain s
and skipcomment s = LexEngine.lex {lexmain=lexmain, skipcomment=skipcomment} Tables.skipcomment s
end
end