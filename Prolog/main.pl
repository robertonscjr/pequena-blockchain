:- initialization(main).

%! ----------- Funcoes relacionadas a Bloco -----------

%! Cria Bloco Genesis
buildBlocoGenesis(0, 0, [(7,0,1000), (7,1,1000)] , "before", "hash").

%! Cria Bloco
buildBloco(Index, TimeStamp, Transacoes ,HashAnterior, Hash).

%! Cria Bloco e verifica se o Index já existe na blockchain, se existir verifica na proxima posicao até chegar em um Index nao existente na blockchain, quando encontra constroi o bloco.
buildBlocoNaBlockchain(N, TimeStamp, Transacoes, HashAnterior, Hash):- buildBloco(N, _,_,_,_) -> I is N+1, buildBlocoNaBlockchain(I) ; buildBloco(N, TimeStamp, Transacoes, HashAnterior, Hash).

%! ----------- Funcoes relacionadas a Transacao -----------

%! Cria transacao pendente e a coloca em formato de Lista.
buildTransacaoPendente(Sender, Receiver, Valor, [Sender,Receiver,Valor]).

%! Cria lista de transações pendentes
buildListaTransacaoPendentes(Transacao):- Transacao = [].

%! Adiciona uma nova transacao na lista de transações pendentes.
addTransacaoPendente(TransacaoPendente, TransacoesPen, [TransacoesPen|TransacaoPendente]).

%! Obter transacao
obterTransacao()

%! Transfere as transacoes pendentes para a lista de transcoes feitas no bloco.
transfereTransacoesPendentes([],L1,L2).
transfereTransacoesPendentes([Head|Tail],L1,[Head|L2]) :-
   transfereTransacoesPendentes(Tail,L1,L2).

%! ----------- Funcoes relacionadas a Blockchain -----------

%! Cria uma blockchain
buildBlockchain(Cadeia) :- Cadeia = [].

%! Adiciona bloco na blockchain
addBloco(Cadeia, Bloco, [Bloco|Cadeia]).


main :- read_line_to_string(user_input, opcoes(user_input, Funcao_chamada)),



buildBlockchain(Cadeia), buildBlocoGenesis(I, T, Transacoes, HashA, Hash), Genesis = [I, T, Transacoes, HashA, Hash], addBloco(Cadeia, Genesis, Blockchain).


opcoes(Opcao, Funcao):- 
    write_ln("Enviar dinheiro").
    write_ln("Exibir saldo").
    write_ln("Minerar bloco").
    write_ln("Exibir transacoes pendentes").
    write_ln("Sair").

    

    