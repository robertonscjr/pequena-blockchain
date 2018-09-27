#include <stdio.h>

typedef struct {
	int sender;
	int receiver;
	int valor;
} transacao;

typedef struct {
	int index;
	int timestamp;
	transacao dado[1000];
	int quantidade_transacoes;
	int hash_anterior;
	int hash;
} bloco;

typedef struct {
	bloco cadeia[100];	
} blockchain;

// OBJETO DA BLOCKCHAIN E O CONTADOR DOS BLOCOS
blockchain mytinyblockchain;
int contador_blocos = 0;

// ARRAY E CONTADOR DAS TRANSACOES PENDENTES
transacao transacoes_pendentes[1000];
int contador_transacoes_pendentes = 0;


void enviar_dinheiro() {
	printf("Enviar dinheiro\n");
}

void exibir_saldo() {
	printf("Exibir saldo\n");
}

void minerar_bloco() {
    printf("Minera bloco\n");
	int i;
	//ITERA A PARTIR DA QUANTIDADE DE TRANSACOES PENDENTES PULANDO O BLOCO GENESIS
	for(i = 1; i < contador_transacoes_pendentes+1; i++){
	    mytinyblockchain.cadeia[i + contador_blocos].index = i + contador_blocos;
    	mytinyblockchain.cadeia[i + contador_blocos].timestamp = _obter_timestamp();

	    mytinyblockchain.cadeia[i + contador_blocos].dado[i + contador_blocos].sender = transacoes_pendentes[i + contador_blocos].sender;
    	mytinyblockchain.cadeia[i + contador_blocos].dado[i + contador_blocos].receiver = transacoes_pendentes[i + contador_blocos].receiver; 
		mytinyblockchain.cadeia[i + contador_blocos].dado[i + contador_blocos].valor = transacoes_pendentes[i + contador_blocos].valor;
		
	    mytinyblockchain.cadeia[i + contador_blocos].quantidade_transacoes;
	    mytinyblockchain.cadeia[i + contador_blocos].hash_anterior = mytinyblockchain.cadeia[i-1 + contador_blocos].hash;
	    mytinyblockchain.cadeia[i + contador_blocos].hash = _obter_hash(mytinyblockchain.cadeia[i+ contador_blocos].index, mytinyblockchain.cadeia[i+ contador_blocos].timestamp, mytinyblockchain.cadeia[i + contador_blocos].hash_anterior);
        
	    contador_blocos += 1;
        }
		
}

void exibir_transacoes_pendentes() {
	printf("Exibir transações pendentes\n");
}

void sair() {
	printf("Sair\n");
}

int _obter_timestamp() {
	return (int)time(NULL);
}

// TODO: IMPLEMENTAR CALCULO DO HASH DE UM BLOCO
int _obter_hash(int index, int timestamp, int hash_anterior) {
	return timestamp * (hash_anterior + index);
}



int main() {


	// BLOCO GÊNESIS
	bloco genesis;

	// O CONTADOR DE BLOCOS DEFINE O INDEX DE UM BLOCO
	genesis.index = contador_blocos;

	// O TIMESTAMP É CALCULADO COM A HORA DO SISTEMA
	genesis.timestamp = _obter_timestamp();

	//  7 = SATOSHI MANJAMUITO
	//  0 = ALICE
	//  1 = BOB
	genesis.dado[0].sender = 7;
	genesis.dado[0].receiver = 0;
	genesis.dado[0].valor = 1000;

	genesis.dado[1].sender = 7;
	genesis.dado[1].receiver = 1;
	genesis.dado[1].valor = 1000;
	genesis.quantidade_transacoes = 2;

	// HASH ANTERIOR É ARBITRÁRIO NO BLOCO GÊNESIS
	genesis.hash_anterior = 0;

	// CÁLCULO DO HASH DO BLOCO GÊNESIS
	genesis.hash = _obter_hash(genesis.index, genesis.timestamp,
							   genesis.hash_anterior);

	mytinyblockchain.cadeia[contador_blocos] = genesis;


	int opcao = 1;
	do {
		printf("\n\tMyTinyBlockchain\n\n");
		printf("1. Enviar dinheiro\n");
		printf("2. Exibir saldo\n");
		printf("3. Minerar um bloco\n");
		printf("4. Exibir transações pendentes\n");
		printf("5. Sair\n");

		scanf("%d", &opcao);
		system("cls || clear");

		switch(opcao) {
			case 1:
				enviar_dinheiro();
				break;

			case 2:
				exibir_saldo();
				break;

			case 3:
				minerar_bloco();
				break;

			case 4:
				exibir_transacoes_pendentes();
				break;

			case 5:
				sair(); 
				break;

			default:
				printf("Digite uma opcao valida\n");
		}
	} while(opcao != 5);
}
