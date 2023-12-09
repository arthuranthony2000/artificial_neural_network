clc
clear all
close all

% Função alvo: f(x, y, z) = (x - 3)^2 + (y - 2)^2 + (z + 1)^2
funcao_alvo = @(x, y, z) (x - 3)^2 + (y - 2)^2 + (z + 1)^2;

% Parâmetros do gradiente descendente
taxa_aprendizado = 0.1;
num_iteracoes = 100;
ponto_inicial = [0, 0, 0]; % Ponto inicial

% Gradiente Descendente
ponto_atual = ponto_inicial;
for iteracao = 1:num_iteracoes
    % Calcular o gradiente numérico
    gradiente_numerico = zeros(size(ponto_atual));
    epsilon = 1e-6;

    for i = 1:length(ponto_atual)
        ponto_perturbado = ponto_atual;
        ponto_perturbado(i) = ponto_perturbado(i) + epsilon;
        derivada_numerica_i = (funcao_alvo(ponto_perturbado(1), ponto_perturbado(2), ponto_perturbado(3)) - ...
                               funcao_alvo(ponto_atual(1), ponto_atual(2), ponto_atual(3))) / epsilon;
        gradiente_numerico(i) = derivada_numerica_i;
    end

    % Atualizar os parâmetros usando o gradiente
    ponto_atual = ponto_atual - taxa_aprendizado * gradiente_numerico;

    % Exibir informações a cada iteração (opcional)
    fprintf('Iteração %d: ponto = [%.4f, %.4f, %.4f], f(ponto) = %.4f\n', iteracao, ponto_atual, funcao_alvo(ponto_atual(1), ponto_atual(2), ponto_atual(3)));
end

% Resultado final
fprintf('Resultado final: ponto = [%.4f, %.4f, %.4f], f(ponto) = %.4f\n', ponto_atual, funcao_alvo(ponto_atual(1), ponto_atual(2), ponto_atual(3)));
