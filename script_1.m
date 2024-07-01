clc
clear
close all

x = [0 0; 0 1; 1 0; 1 1];
w = cell(1, 2);
n = 2;
w{1} = [-0.424 -0.74 -0.961; 0.358 -0.577 -0.961];
w{2} = [-0.017; -0.893; 0.148];

f = @(x) 1/(1 + exp(1)^-x);

y = [0 1 1 0];

e = evaluate(x, w, f, y);
%%
dim = zeros(n, 2);

w_vector = [];

for i = 1:n
    dim(i, 1) = size(w{i}, 1);
    dim(i, 2) = size(w{i}, 2);
    w_vector = [w_vector reshape(w{i}, [1  dim(i, 1) * dim(i, 2)])];
end

fobj = @(w) fitness(x, w, n, f, y, dim, @evaluate);




