clc
clear
close all

x = [0 0; 0 1; 1 0; 1 1];
w = cell(1, 2);
n = 2;
m = 9;
w{1} = [-1 2 3; 1 3 -1];
w{2} = [-10; 10; -7];

f = @(x) 1/(1 + exp(1)^-x);

y = [0 1 1 0];

error_w0 = perceptron_evaluate(x, w, f, y);

dim = zeros(n, 2);

for i = 1:n
    dim(i, 1) = size(w{i}, 1);
    dim(i, 2) = size(w{i}, 2);
end

w0 = [];

for i = 1:n
    w0 = [w0 reshape(w{i}, [1 dim(i, 1) * dim(i, 2)])];
end

itermax = 10000;

fobj = @(w) perceptron_fitness(x, w, n, f, y, dim, @perceptron_evaluate);

g = @(w) perceptron_direct(x, w, f, n, dim);

learning_rate = 10;

w_out = gradient_descent(g, w0, y, learning_rate, itermax);

error = fobj(w_out);


