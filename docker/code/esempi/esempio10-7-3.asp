% Enumerazione vincolata

non_scelto(X, Y) :- possibile(X), scelto(Z, Y), Z!=X.
non_scelto(X, Y) :- possibile(Y), scelto(X, Z), Z!=Y.
scelto(X, Y) :- possibile_1(X), possibile_2(Y), not non_scelto(X, Y).

possibile(1).
possibile(2).
possibile(3).

possibile_1(X) :- possibile(X).
possibile_2(X) :- possibile(X).

#show scelto/2.
