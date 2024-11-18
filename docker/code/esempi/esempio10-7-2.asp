% Scelta univoca

possibile(a).
possibile(b).
possibile(c).

scelto(X) :- possibile(X), not differente_da_scelto(X).
differente_da_scelto(X) :- possibile(X), scelto(Y), X!=Y.

#show scelto/1.
#show differente_da_scelto/1.