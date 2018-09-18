# Uma Pequena Blockchain 

Três implementações de uma simples blockchain (C, Haskell e Prolog) serão produzidas durante a execução do projeto. Nestas implementações, haverá uma aplicação de uma blockchain em um problema real: o envio de dinheiro entre duas pessoas (uma transação acontecendo na nossa blockchain). Conceitos mais sofisticados como algoritmo de consenso e interoperabilidade entre nós não serão implementados, pois deixaria o projeto muito complexo.

## Funcionalidades

O sistema deve ser capaz de permitir algumas operações básicas que se pode fazer em uma blockchain.

```
MyTinyBlockchain
1. Enviar dinheiro
2. Exibir saldo
3. Minerar um bloco
4. Exibir transações pendentes
5. Sair
```

### Descrição de funcionalidades

* Seleciona quem é o sender (Alice ou Bob) e pergunta valor a ser enviado.
* Exibe saldo de Alice e Bob. Esta opção deve percorrer a blockchain e acumular os valores de Alice e Bob.
* Minera um bloco com as transações pendentes.
* Exibe as transações pendentes.
* Sair do sistema.

### Conceitos importantes
* **Bloco:** elemento mínimo de uma blockchain.
* **Bloco gênesis:** primeiro bloco minerado.
* **Parâmetros do bloco:** Index, Timestamp, Dado, Hash anterior e Hash do bloco
* **Processamento das transações dentro de um bloco:** percorrer o dado de um bloco e fazer o cálculo dos saldos de Alice e Bob baseando-se nas transações registradas.
* **Mineração de um bloco:** criação de um bloco novo com as transações pendentes adicionadas à lista de transações registradas.
* **Transações pendentes:** Os envios de dinheiro que ainda não foram armazenados em um bloco minerado devem ser armazenados em uma fila que contém as transações a serem armazenadas na próxima mineração de um bloco.

