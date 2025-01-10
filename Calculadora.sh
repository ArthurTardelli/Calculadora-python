#!/bin/bash

# Início do código

# Função para exibir o menu
show_menu() {
    echo "==================================="
    echo "        Calculadora Avançada       "
    echo "==================================="
    echo "1. Adição"
    echo "2. Subtração"
    echo "3. Multiplicação"
    echo "4. Divisão"
    echo "5. Exponenciação"
    echo "6. Raiz Quadrada"
    echo "7. Módulo (Resto da Divisão)"
    echo "8. Sair"
    echo "==================================="
}

# Função para executar a calculadora
calculate() {
    case $1 in
        1)
            echo "Digite o primeiro número:"
            read num1
            echo "Digite o segundo número:"
            read num2
            echo "Resultado: $num1 + $num2 = $(echo "$num1 + $num2" | bc)"
            ;;
        2)
            echo "Digite o primeiro número:"
            read num1
            echo "Digite o segundo número:"
            read num2
            echo "Resultado: $num1 - $num2 = $(echo "$num1 - $num2" | bc)"
            ;;
        3)
            echo "Digite o primeiro número:"
            read num1
            echo "Digite o segundo número:"
            read num2
            echo "Resultado: $num1 * $num2 = $(echo "$num1 * $num2" | bc)"
            ;;
        4)
            echo "Digite o primeiro número:"
            read num1
            echo "Digite o segundo número:"
            read num2
            if [ "$num2" -eq 0 ]; then
                echo "Erro: Divisão por zero não é permitida."
            else
                echo "Resultado: $num1 / $num2 = $(echo "scale=2; $num1 / $num2" | bc)"
            fi
            ;;
        5)
            echo "Digite a base:"
            read base
            echo "Digite o expoente:"
            read expoente
            echo "Resultado: $base ^ $expoente = $(echo "$base ^ $expoente" | bc)"
            ;;
        6)
            echo "Digite o número:"
            read num
            if [ "$(echo "$num < 0" | bc)" -eq 1 ]; then
                echo "Erro: Não é possível calcular a raiz quadrada de um número negativo."
            else
                echo "Resultado: √$num = $(echo "scale=2; sqrt($num)" | bc)"
            fi
            ;;
        7)
            echo "Digite o primeiro número (dividendo):"
            read num1
            echo "Digite o segundo número (divisor):"
            read num2
            if [ "$num2" -eq 0 ]; then
                echo "Erro: Divisão por zero não é permitida."
            else
                echo "Resultado: $num1 % $num2 = $(echo "$num1 % $num2" | bc)"
            fi
            ;;
        8)
            echo "Saindo da calculadora. Até mais!"
            exit 0
            ;;
        *)
            echo "Opção inválida. Por favor, tente novamente."
            ;;
    esac
}

# Loop principal
while true; do
    show_menu
    echo "Escolha uma opção:"
    read option
    calculate $option
    echo ""
done
