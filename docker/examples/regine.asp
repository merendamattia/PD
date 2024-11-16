%******************************************************************************%
% Author: Simone Colli
% GitHub: https://github.com/SimoneColli
% 
% Description:
% Questo programma risolve il problema delle N regine, ovvero il posizionamento
% di N regine su una scacchiera NxN in modo tale che nessuna di esse possa
% attaccarne un'altra.
% Una regina può attaccare un'altra se si trovano sulla stessa riga, colonna o
% diagonale.
% 
% Execution:
% clingo -c n=<dimensione> regine.asp
% Esampio: clingo -c n=4 regine.asp
% 
% Notes:
% - Il parametro `n` specifica la dimensione della scacchiera (NxN).
% - L'output contiene una o più soluzioni valide con le posizioni delle regine.
% 
%******************************************************************************%



size(n).
grid(1..X, 1..X) :- size(X).

coord(X, Y) :- grid(X, Y).

% mette una regina se non attacca su riga, colonna e diagonale
1{queen(X, Y) : coord(X, Y)}1 :-
                        coord(X, Y),
                        not attack_row(X, Y),
                        not attack_col(X, Y),
                        not attack_diag(X, Y).

% queen che non sono sulla stessa riga
attack_row(X, Y) :-
    coord(X, Y), % X, Y sono coordinate
    queen(X, Z), coord(X, Z), Z != Y. % se ho una regina sulla stessa riga (X) variando la colonna (Z diversa da Y)

% queen che non sono sulla stessa colonna
attack_col(X, Y) :-
    coord(X, Y), % X, Y sono coordinate
    queen(W, Y), coord(W, Y), W != X. % se ho una regina sulla stessa colonna (Y) variando la riga (W diversa da X)

% queen che non sono sulla stessa diagonale
attack_diag(X, Y) :-
    coord(X, Y), % X, Y sono coordinate
    coord(W, Z), % W, Z sono altre coordinate
    queen(W, Z), % nella posizione W,Z deve esserci una queen
    W != X, % riga differente
    |X - W| = |Y - Z|.



% voglio avere solo le soluzioni che mi posizionano esattamente n regine
:- not n{queen(X, Y) : coord(X, Y)} n.


% mostra solo le queen (vedi p. 43 potassco)
#show queen/2.

