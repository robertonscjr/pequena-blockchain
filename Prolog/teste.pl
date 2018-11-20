:- initialization(main).


transacao(T) :- T = [[1,5],[0,9],[1,4],[1,7]].

transacao(Valor, X):- Valor is (X * 100).

% transacaoPendente(0,1,100).
% transacaoPendente(1,0,50).
% transacaoPendente(1,0,25).

exibir_saldo(_, [], Saldo, Saldo).
exibir_saldo(X, [[H1, H2] | T], Saldo, Total) :- H1 =:= X , transacao(Valor, H2), NSALDO is Saldo + Valor, exibir_saldo(1, T, NSALDO, Total).  
exibir_saldo(X, [[H1, H2] | T], Saldo, Total) :- H1 =\= X , transacao(Valor, H2), NSALDO is Saldo - Valor, exibir_saldo(1, T, NSALDO, Total).  
  
main:-
    transacao(T),
    exibir_saldo(1, T, 0, Total),
    write_ln(Total).