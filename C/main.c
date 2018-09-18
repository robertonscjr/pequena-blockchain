#include<stdio.h>

void enviar_dinheiro()
{
    printf("Enviar dinheiro\n");
}

void exibir_saldo()
{
    printf("Exibir saldo\n");
}

void minerar_bloco()
{
    printf("Minerar um bloco\n");
}

void exibir_transacoes_pendentes()
{
    printf("Exibir transações pendentes\n");
}

void sair()
{
	printf("Sair\n");
}

int main()
{
    int opcao = 1;

    do
    {
        printf("\n\tMyTinyBlockchain\n\n");
        printf("1. Enviar dinheiro\n");
        printf("2. Exibir saldo\n");
        printf("3. Minerar um bloco\n");
        printf("4. Exibir transações pendentes\n");
        printf("5. Sair\n");

        scanf("%d", &opcao);
        system("cls || clear");

        switch(opcao)
        {
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
