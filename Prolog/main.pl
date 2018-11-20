:- initialization(main).

%! Lista de transcoes pendentes previamente mineradas

transacao(1,0,100).
transacao(0,1,200).
transacao(0,1,300).
transacao(1,0,400).
transacao(1,0,500).
transacao(1,0,600).

transacaoPendente(0,1,100).
transacaoPendente(1,0,50).
transacaoPendente(1,0,25).


%! ----------- Funcoes relacionadas a Bloco -----------

%! Cria Bloco Genesis
buildBlocoGenesis(0, 0, [(7,0,1000), (7,1,1000)] , "before", "hash").

%! Cria Bloco
buildBloco(Index, TimeStamp, Transacoes ,HashAnterior, Hash).

%! Cria Bloco e verifica se o Index já existe na blockchain, se existir verifica na proxima posicao até chegar em um Index nao existente na blockchain, quando encontra constroi o bloco.
buildBlocoNaBlockchain(N, TimeStamp, Transacoes, HashAnterior, Hash):- 
buildBloco(N, _,_,_,_) -> I is N+1, 
buildBlocoNaBlockchain(I); 
buildBloco(N, TimeStamp, Transacoes, HashAnterior, Hash).

%! ----------- Funcoes relacionadas a Transacao -----------

%! Cria transacao pendente e a coloca em formato de Lista.

buildTransacaoPendente(Sender, Receiver, Valor, Transacao) :- 
Transacao = [Sender,Receiver,Valor].


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

%! Menu
main :- 
  write_ln("1.Enviar dinheiro (nao implementado)"),
  write_ln("2.Exibir saldo"),
  write_ln("3.Minerar bloco (nao implementado)"),
  write_ln("4.Exibir transacoes pendentes"),
  write_ln("5.Sair"),

  read_line_to_codes(user_input, Codes),
  string_to_atom(Codes, Atom),
  atom_number(Atom, Opcao).

  opcoes(Opcao).

opcoes(Opcao):-
   (
   (Opcao =:= 1 , enviar_dinheiro(Sender));
   (Opcao =:= 2, exibir_saldo);
   (Opcao =:= 3, minerar_bloco);
   (Opcao =:= 4, exibir_transacoes_pendentes());
   (Opcao =:= 5, break);
   (writeln("Opção inválida, digite novamente"), read(Escolha), opcoes(Escolha))
   ).

buildBlockchain(Cadeia),
buildBlocoGenesis(I, T, Transacoes, HashA, Hash), 
Genesis = [I, T, Transacoes, HashA, Hash], 
addBloco(Cadeia, Genesis, Blockchain).


%! Enviar dinheiro

enviar_dinheiro(Sender) :-
  write_ln("Enviar dinheiro").
  write_ln("Sender(0 para Alice e 1 para Bob): ").
  
  read_line_to_codes(user_input, Codes).
  string_to_atom(Codes, Atom).
  atom_number(Atom, Valor).

%! Exibir Saldo

exibir_saldo(Pessoa) :-




%! Exibir Transacoes Pendentes

exibir_transacoes_pendentes().
