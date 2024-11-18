% Operare con ordinamenti

oggetto(1).
oggetto(2).
oggetto(3).
oggetto(4).
oggetto(5).

non_il_piu_piccolo(X) :- oggetto(X), oggetto(Y), minore(Y, X).
il_piu_piccolo(X) :- oggetto(X), not non_il_piu_piccolo(X).

non_il_piu_grande(X) :- oggetto(X), oggetto(Y), minore(X, Y).
il_piu_grande(X) :- oggetto(X), not non_il_piu_grande(X).

non_il_prossimo(X, Y) :- oggetto(X), oggetto(Y),
                        X == Y.
non_il_prossimo(X, Y) :- oggetto(X), oggetto(Y),
                        minore(Y, X).
non_il_prossimo(X, Y) :- oggetto(X), oggetto(Y), oggetto(Z), 
                        minore(X, Z), minore(Y, Z).

minore(X, Y) :- oggetto(X), oggetto(Y), X < Y.

il_prossimo(X, Y) :- oggetto(X), oggetto(Y), 
                        not non_il_prossimo(X, Y).

#show il_piu_piccolo/1.
#show il_piu_grande/1.