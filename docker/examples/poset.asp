%*
	Author: Manuel Di Agostino
	https://github.com/manueldiagostino

	Questo programma permette di ricercare i minoranti, rispettivamente i
	maggioranti, e il minimo, rispettivamente il massimo, in un poset.
	La relazione d'ordine utilizzata è quella del '|' (divide), rappresentata dal seguente diagramma di Hasse :

				24
				|
				12
				|
				6
			/   \
		 2     3

	ossia, 2|6, 2|12, 3|24 etc.
*%

%*
	Decommentando i predicati relativi a `1` si aggiunge un minimo al poset di
	partenza. Decommentando quelli relativi a `156` si ottengono due maggioranti.
*%
%obj(1).
obj(2).
obj(3).
obj(6).
obj(12).
obj(24).
%obj(156).

%leq_dir(1,2).
leq_dir(1,3).
leq_dir(2,6).
leq_dir(3,6).
leq_dir(6,12).
leq_dir(12,24).
%leq_dir(12,156).

%*
il predicato `leq/2` implementa la chiusura transitiva riflessiva della
relazione utilizzata (si noti che è stato definito soltanto il collegamento
diretto tra due interi nel diagramma tramite `leq_dir/2`. Questo permette di
aggiungere i termini {leq(2,12), leq(3,12), leq(2,24), ...} al modello.
*%
leq(X,X) :- obj(X).
leq(X,Y) :- obj(X), obj(Y), leq_dir(X,Y), X!=Y.
leq(X,Y) :-
	obj(X), obj(Y), obj(Z),
	X!=Y, X!=Z, Y!=Z,
	leq(X,Z), leq(Z,Y).


not_minorant(X) :- obj(X), obj(Y), X!=Y, leq(Y,X).
minorant(X) :- obj(X), not not_minorant(X).

not_minor(X) :- not_minorant(X).
not_minor(X) :- obj(X), obj(Y), X!=Y, minorant(X), minorant(Y).
minor(X) :- obj(X), not not_minor(X).


not_majorant(X) :- obj(X), obj(Y), X!=Y, leq(X,Y).
majorant(X) :- obj(X), not not_majorant(X).

not_major(X) :- not_majorant(X).
not_major(X) :- obj(X), obj(Y), X!=Y, majorant(X), majorant(Y).
major(X) :- obj(X), not not_major(X).


not_next(X,Y) :- obj(X), obj(Y), X == Y.
not_next(X,Y) :- leq(X,Y).
not_next(X,Y) :-
    obj(X), obj(Y), obj(Z), Z!=X, Z!=Y,
    leq(X,Z), leq(Z,Y).
not_next(X,Y) :-
    obj(X), obj(Y), X!=Y, Y!=X,
    not leq(X,Y), not leq(Y,X).
next(X,Y) :- obj(X), obj(Y), not not_next(X,Y).

%#show leq/2.
%#show next/2.
#show minorant/1.
#show minor/1.
#show majorant/1.
#show major/1.
