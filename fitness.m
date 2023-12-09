function error = fitness(x, w, n, f, y, dim, evaluate)

w_out = cell(1, n);

k = 1;
for i = 1:n
    w_out{i} = reshape(w(1, k:k+dim(i, 1) * dim(i, 2)-1), [dim(i, 1), dim(i, 2)]);
    k = dim(i, 1) * dim(i, 2) + 1;
end

error = evaluate(x, w_out, f, y);
end