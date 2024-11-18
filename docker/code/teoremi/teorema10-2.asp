a :- not na.
na :- not a.
b :- not nb.
nb :- not b.
c :- not nc.
nc :- not c.

c1 :- a.
c1 :- nb.
c1 :- c.

c2 :- na.
c2 :- b.
c2 :- nc.

:- not c1.
:- not c2.
