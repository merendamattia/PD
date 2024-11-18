% Enumerazione generica

possibile(a).
possibile(b).
possibile(c).

scelto(X) :- possibile(X), not non_scelto(X).
non_scelto(X) :- possibile(X), not scelto(X).
p :- scelto(X).
:- not p. % Almeno uno deve essere scelto

#show scelto/1.
#show non_scelto/1.