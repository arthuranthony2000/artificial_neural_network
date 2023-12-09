clc
clear all
close all

% Função alvo: f(x) = (x - 3)^2
funcao_alvo = @(x) (x - 3)^2;

% Derivada da função alvo: f'(x) = 2*(x - 3)
derivada_funcao = @(x) 2*(x - 3);

% Parâmetros do gradiente descendente
taxa_aprendizado = 0.1;
num_iteracoes = 100;
x_inicial = 0; % Ponto inicial

% Gradiente Descendente
x_atual = x_inicial;
for iteracao = 1:num_iteracoes
    gradiente = derivada_funcao(x_atual);
    x_atual = x_atual - taxa_aprendizado * gradiente;

    % Exibir informações a cada iteração (opcional)
    fprintf('Iteração %d: x = %.4f, f(x) = %.4f\n', iteracao, x_atual, funcao_alvo(x_atual));
end

% Resultado final
fprintf('Resultado final: x = %.4f, f(x) = %.4f\n', x_atual, funcao_alvo(x_atual));
